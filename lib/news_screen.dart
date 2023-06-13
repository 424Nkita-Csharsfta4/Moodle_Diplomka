import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class NewsScreen extends StatelessWidget {
  final String username;

  const NewsScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apple News'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, $username',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          WrapExample(),
          // Add your news feed content here
        ],
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        // Optional badge argument: keys are tab indices, values can be
        // String, IconData, Color or Widget.
        /*badge=*/ const <int, dynamic>{3: '99+'},
        style: TabStyle.reactCircle,
        items: <TabItem>[
          const TabItem(icon: Icons.home, title: 'home'),
          const TabItem(icon: Icons.map, title: 'map'),
          const TabItem(icon: Icons.add, title: 'add'),
          const TabItem(icon: Icons.message, title: 'message'),
          const TabItem(icon: Icons.people, title: 'people'),
        ],
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}

class WrapExample extends StatelessWidget {
  const WrapExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // Gap between adjacent chips.
      spacing: 8.0,
      // Gap between lines.
      runSpacing: 4.0,
      children: [
        'Программирование',
        'Задачки',
        'C#',
        'PHP',
        'C#',
        'Расписание',
        'Учетеля',
      ]
          .map(
            (String name) => Chip(
              avatar: CircleAvatar(child: Text(name.substring(0, 1))),
              label: Text(name),
              backgroundColor: const Color.fromARGB(
                  255, 255, 173, 49), // Set the background color to orange
            ),
          )
          .toList(),
    );
  }
}
