import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// Форма входа
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
// Обработчик нажатия кнопки входа
              },
              child: Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
