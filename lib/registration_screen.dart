import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main_ribbon.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class User {
  final String firstName;
  final String lastName;

  User({required this.firstName, required this.lastName});
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _showPassword = false;
  String? _userType;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void handleRegistration() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      final url = Uri.parse(''); // Replace with your registration API endpoint
      final body = jsonEncode({'email': email, 'password': password});

      try {
        final response = await http.post(url, body: body);

        if (response.statusCode == 200) {
          // Registration successful, navigate to the news feed screen
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewsFeedScreen(),
            ),
          );
        } else {
          // Show error dialog for invalid credentials
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Ошибка'),
              content: const Text('Неверные учетные данные.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (error) {
        // Show error message for network errors
        // ignore: avoid_print
        print('Ошибка: $error');
      }
    } else {
      // Form is invalid, do something (e.g., show error message)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NewsFeedScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      // appBar: MainRibbon(), // Use MainRibbon instead of AppBar
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://sun9-26.userapi.com/impg/BcM9ZJnyLKJi0UktgxUL7h8CkA2ST267KkQqKA/28lOIrfjYRU.jpg?size=224x54&quality=96&sign=f1983bbc9e9ee561cb728867db89e1f6&type=album',
                width: 200,
                height: 200,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Регистрация',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Почта',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите почту';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'ФИО',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите ФИО';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
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
              ElevatedButton(
                onPressed: handleRegistration,
                child: const Text('Регистрация'),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handler for "Вход" button press
                    },
                    child: const Text('Вход'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpecializationSelectionScreen extends StatelessWidget {
  const SpecializationSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор специальности'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Выберите группу, в которой вы учитесь:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handler for selecting specialization button press
                },
                child: const Text('Юристы'),
              ),
            ),
            const SizedBox(height: 8), // Spacing between specializations
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handler for selecting specialization button press
                },
                child: const Text('Программисты'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handler for selecting specialization button press
                },
                child: const Text('Инженеры'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handler for selecting specialization button press
                },
                child: const Text('Философы'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainRibbon extends StatelessWidget {
  const MainRibbon({Key? key}) : super(key: key);

  // ignore: override_on_non_overriding_member
  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Image.network(
        'https://sun9-26.userapi.com/impg/BcM9ZJnyLKJi0UktgxUL7h8CkA2ST267KkQqKA/28lOIrfjYRU.jpg?size=224x54&quality=96&sign=f1983bbc9e9ee561cb728867db89e1f6&type=album',
        width: 150,
      ),
      centerTitle: true,
    );
  }
}
