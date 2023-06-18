import 'package:flutter/material.dart';
import 'news_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

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
                // Email input field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Электронная почта',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите электронную почту';
                    }
                    // Add any other email validation logic here as per your requirements
                    return null;
                  },
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                // Password input field
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите пароль';
                    }
                    // Add any other password validation logic here as per your requirements
                    return null;
                  },
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      String email = _emailController.text;
                      // ignore: unused_local_variable
                      String password = _passwordController.text;

                      // Authenticate the user here with the provided email and password
                      // Add your authentication logic here

                      // Navigate to the news screen with the user's name
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsScreen(username: email),
                        ),
                      );
                    }
                  },
                  // ignore: sort_child_properties_last
                  child: const Text('Войти'),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.orange,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
