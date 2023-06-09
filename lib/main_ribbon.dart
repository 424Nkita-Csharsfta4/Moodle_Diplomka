import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лента новостей'),
      ),
      body: const Center(
        child: Text(
          'Здесь будет ваша лента новостей',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
