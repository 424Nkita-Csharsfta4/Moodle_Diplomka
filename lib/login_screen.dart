import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Поле ввода электронной почты
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Электронная почта',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пожалуйста, введите электронную почту';
                    }
                    // Добавьте здесь любую другую валидацию почты по вашему усмотрению
                    return null;
                  },
                ),
                // Поле ввода пароля
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пожалуйста, введите пароль';
                    }
                    // Добавьте здесь любую другую валидацию пароля по вашему усмотрению
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // При нажатии кнопки проверяем валидность полей
                    if (_formKey.currentState!.validate()) {
                      // Если поля валидны, можно выполнять действия, например, авторизацию
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      // Добавьте здесь логику для обработки входа
                    }
                  },
                  child: const Text('Войти'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
