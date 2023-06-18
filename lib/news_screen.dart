import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/people_screen.dart';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
// ignore: unused_import
import 'package:my_app/profile_screen.dart';
// ignore: unused_import
import 'package:my_app/chat_screen.dart';

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
        backgroundColor:
            Colors.orange, // Используем оранжевый цвет для контраста
      ),
      body: Center(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            const HomeScreen(),
            const MapScreen(),
            AddScreen(newsList: newsList),
            const MessageScreen(),
            // ignore: prefer_const_constructors
            PeopleScreen(),
            // ignore: prefer_const_constructors
            //ChatScreen(user: null),
          ],
        ),
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
        backgroundColor: Colors.blue, // Используем синий цвет для контраста
        activeColor: Colors.white,
        color: Colors.grey,
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
        backgroundColor:
            Colors.orange, // Используем оранжевый цвет для контраста
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
              'https://sun9-75.userapi.com/impg/YyIdpShX2jvQ0F_ZgCs-ln3ouzAI_5A7i7MT9g/9gACThqP5PE.jpg?size=736x729&quality=95&sign=322a2764abf4ca67251eccd368d5f6e3&type=album',
            ),
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
              textAlign: TextAlign.center, // Выравнивание заголовка по центру
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'By $author',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center, // Выравнивание автора по центру
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
