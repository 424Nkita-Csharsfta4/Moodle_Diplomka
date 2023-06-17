import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
// import 'profile_screen.dart';
// import 'chat_screen.dart';

class NewsScreen extends StatefulWidget {
  final String username;

  const NewsScreen({Key? key, required this.username}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int _currentIndex = 2;
  List<String> newsList = [];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 2) {
      _fetchNewsFromAPI();
    }
  }

  Future<void> _fetchNewsFromAPI() async {
    try {
      final response = await http.get(Uri.parse('http://example.com/api/news'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final news = data['news'] as List<dynamic>;

        setState(() {
          newsList = news.map((item) => item.toString()).toList();
        });
      } else {
        throw Exception('Failed to fetch news');
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лента'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeScreen(),
          const MapScreen(),
          AddScreen(newsList: newsList),
          const MessageScreen(),
          // ignore: prefer_const_constructors
          PeopleScreen(),
          // ignore: prefer_const_constructors
          ChatScreen(user: null),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        items: const <TabItem>[
          TabItem(icon: Icons.home, title: 'home'),
          TabItem(icon: Icons.map, title: 'map'),
          TabItem(icon: Icons.add, title: 'add'),
          TabItem(icon: Icons.message, title: 'message'),
          TabItem(icon: Icons.people, title: 'people'),
        ],
        onTap: _onTabTapped,
        initialActiveIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 123, 22, 255),
        activeColor: Colors.white,
        color: Colors.grey,
        //badgeColors: const [Colors.red, Colors.green],
        // Отображение значка с количеством уведомлений
        // badgeBuilder: (context, icon, index) {
        //   var notificationCount;
        //   if (index == 3 && notificationCount > 0) {
        //     return Stack(
        //       children: [
        //         icon,
        //         Positioned(
        //           top: 0,
        //           right: 0,
        //           child: Container(
        //             padding: const EdgeInsets.all(2),
        //             // ignore: prefer_const_constructors
        //             decoration: BoxDecoration(
        //               color: Colors.red,
        //               shape: BoxShape.circle,
        //             ),
        //             constraints: const BoxConstraints(
        //               minWidth: 18,
        //               minHeight: 18,
        //             ),
        //             child: Text(
        //               notificationCount.toString(),
        //               style: const TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 12,
        //               ),
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         ),
        //       ],
        //     );
        //   }
        //   return icon;
        // },
      ),
    );
  }
}

class AddScreen extends StatelessWidget {
  final List<String> newsList;

  const AddScreen({Key? key, required this.newsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Screen'),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          // ignore: unused_local_variable
          final news = newsList[index];
          return NewsArticleWidget(
            title: 'News Article Title',
            author: 'Author Name',
            image: Image.network(
                'https://sun9-75.userapi.com/impg/YyIdpShX2jvQ0F_ZgCs-ln3ouzAI_5A7i7MT9g/9gACThqP5PE.jpg?size=736x729&quality=95&sign=322a2764abf4ca67251eccd368d5f6e3&type=album'),
          );
        },
      ),
    );
  }
}

class NewsArticleWidget extends StatelessWidget {
  final String title;
  final String author;
  final Image image;

  const NewsArticleWidget({
    Key? key,
    required this.title,
    required this.author,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: image,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'By $author',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: const Center(
        child: Text('Map Screen'),
      ),
    );
  }
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final channel = WebSocketChannel.connect(Uri.parse('wss://example.com/ws'));
  final TextEditingController _controller = TextEditingController();
  List<String> messages = [];

  @override
  void dispose() {
    channel.sink.close();
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final message = snapshot.data.toString();
                  messages.add(message);
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(messages[index]),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No messages received'),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a message',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api

  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  List<User> userList = [
    User(
      name: 'John',
      surname: 'Doe',
      email: 'johndoe@example.com',
      avatar: 'https://example.com/avatar1.jpg',
      friendsCount: 10,
    ),
    User(
      name: 'Jane',
      surname: 'Smith',
      email: 'janesmith@example.com',
      avatar: 'https://example.com/avatar2.jpg',
      friendsCount: 5,
    ),
    User(
      name: 'Alice',
      surname: 'Johnson',
      email: 'alicejohnson@example.com',
      avatar: 'https://example.com/avatar3.jpg',
      friendsCount: 15,
    ),
    User(
      name: 'Bob',
      surname: 'Williams',
      email: 'bobwilliams@example.com',
      avatar: 'https://example.com/avatar4.jpg',
      friendsCount: 8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People Screen'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
            ),
            title: Text('${user.name} ${user.surname}'),
            subtitle: Text(user.email),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Friends: ${user.friendsCount}'),
                ElevatedButton(
                  onPressed: () {
                    // Логика добавления пользователя в друзья
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User added to friends'),
                      ),
                    );
                  },
                  child: const Text('Добавить в друзья'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(user: user),
                      ),
                    );
                  },
                  child: const Text('Написать'),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(user: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class User {
  final String name;
  final String surname;
  final String email;
  final String avatar;
  final int friendsCount;

  User({
    required this.name,
    required this.surname,
    required this.email,
    required this.avatar,
    required this.friendsCount,
  });
}

class ProfileScreen extends StatelessWidget {
  final User? user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user?.name} ${user?.surname}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user?.avatar ?? ''),
            radius: 50,
          ),
          const SizedBox(height: 20),
          Text(
            '${user?.name} ${user?.surname}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Email: ${user?.email}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            'Friends: ${user?.friendsCount}',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final User? user;

  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final channel = WebSocketChannel.connect(Uri.parse('wss://example.com/ws'));
  final TextEditingController _controller = TextEditingController();
  List<String> messages = [];

  @override
  void dispose() {
    channel.sink.close();
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.user?.name} ${widget.user?.surname}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final message = snapshot.data.toString();
                  messages.add(message);
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(messages[index]),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No messages received'),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a message',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
