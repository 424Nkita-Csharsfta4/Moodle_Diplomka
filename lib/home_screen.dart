import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true, // Заголовок по центру
      ),
      body: const Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
