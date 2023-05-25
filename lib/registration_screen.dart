import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// Форма регистрации
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Имя',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Электронная почта',
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Пароль',
              ),
            ),
            ElevatedButton(
              onPressed: () {
// Обработчик нажатия кнопки регистрации
              },
              child: const Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}
