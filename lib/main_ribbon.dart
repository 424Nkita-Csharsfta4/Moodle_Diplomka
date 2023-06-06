import 'package:flutter/material.dart';
import 'package:my_app/registration_screen.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:russian_words/russian_words.dart' as russian_words;

class InputGroupNextScreen extends StatelessWidget {
  final User? user;

  const InputGroupNextScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Имя: ${user?.firstName}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Фамилия: ${user?.lastName}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
