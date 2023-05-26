import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _showPassword = false;
  String? _userType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Логотип
            Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            // Надпись "Регистрация"
            const Text(
              'Регистрация',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Инпут для почты
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Почта',
              ),
            ),
            const SizedBox(height: 12),
            // Инпут для пароля
            TextFormField(
              obscureText: !_showPassword,
              decoration: InputDecoration(
                labelText: 'Пароль',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Инпут для ФИО
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'ФИО',
              ),
            ),
            const SizedBox(height: 12),
            // Radio-кнопки для выбора "Студент" или "Учитель"
            ListTile(
              title: const Text('Студент'),
              leading: Radio<String>(
                value: 'Студент',
                groupValue: _userType,
                onChanged: (value) {
                  setState(() {
                    _userType = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Учитель'),
              leading: Radio<String>(
                value: 'Учитель',
                groupValue: _userType,
                onChanged: (value) {
                  setState(() {
                    _userType = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            // Кнопка "Регистрация"
            ElevatedButton(
              onPressed: () {
                // Обработчик нажатия кнопки регистрации
              },
              child: const Text('Регистрация'),
            ),
            const SizedBox(height: 12),
            // Надпись "Есть аккаунт? Вход"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Есть аккаунт?'),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: () {
                    // Обработчик нажатия кнопки "Вход"
                  },
                  child: const Text('Вход'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
