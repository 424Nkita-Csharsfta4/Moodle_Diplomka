import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_app/user.dart';
import 'package:my_app/chat_screen.dart';
import 'package:my_app/add_post.dart';
import 'package:my_app/home_screen.dart';
// ignore: unused_import
import 'package:my_app/profile_screen.dart';
import 'package:my_app/people_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor myAppPrimarySwatch = const MaterialColor(
    0xFFCCF517,
    <int, Color>{
      50: const Color(0xFFFFFEE6),
      100: const Color(0xFFFFFAC2),
      200: const Color(0xFFFFF399),
      300: const Color(0xFFFFEE66),
      400: const Color(0xFFFFEB4D),
      500: const Color(0xFFCCF517),
      600: const Color(0xFF99CA0F),
      700: const Color(0xFF668E08),
      800: const Color(0xFF335307),
      900: const Color(0xFF001A00),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: myAppPrimarySwatch,
      ),
      home: NewsScreen(user: '', username: ''),
      routes: {
        '/add_post': (context) => const AddScreen(newsList: []),
      },
    );
  }
}

class NewsScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final user;
  final String username;

  const NewsScreen({
    Key? key,
    required this.user,
    required this.username,
  }) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int _currentIndex = 0;
  List<String> newsList = [];
  List<String> friendsList = [
    'Friend 1',
    'Friend 2',
    'Friend 3',
    // Add more friends as needed
  ];
  String selectedFriend = '';

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
      print('Error: $error');
    }
  }

  Widget _buildMapScreen() {
    return Center(
      child: GoogleMapWidget(),
    );
  }

  Widget _buildChatScreen() {
    return Center(
      child: PeopleScreen(),
    );
  }

  // Widget _buildPeopleScreen() {
  //   return const ProfileScreen(
  //     userId: '',
  //     user: int,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лента'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            HomeScreen(),
            _buildMapScreen(),
            Container(),
            _buildChatScreen(),
            // _buildPeopleScreen(),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        items: const <TabItem>[
          TabItem(icon: Icons.home, title: 'home'),
          TabItem(icon: Icons.map, title: 'map'),
          TabItem(icon: Icons.add, title: ''),
          TabItem(icon: Icons.message, title: 'message'),
          TabItem(icon: Icons.people, title: 'people'),
        ],
        onTap: _onTabTapped,
        initialActiveIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(209, 231, 126, 255),
        activeColor: Colors.yellow,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddScreen(newsList: []),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class GoogleMapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
