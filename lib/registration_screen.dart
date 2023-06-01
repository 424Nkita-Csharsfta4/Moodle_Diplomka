import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _showPassword = false;
  String? _userType;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
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
              ),
              const SizedBox(height: 20),
              const Text(
                'Регистрация',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Если все поля прошли валидацию
                    // Выполняйте регистрационную логику здесь

                    // Перенаправление на новое окно после успешной регистрации
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpecializationSelectionScreen(),
                      ),
                    );
                  }
                },
                child: const Text('Регистрация'),
              ),
              const SizedBox(height: 12),
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
      ),
    );
  }
}

class SpecializationSelectionScreen extends StatelessWidget {
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
                  // Обработчик нажатия кнопки выбора специальности
                },
                child: const Text('Юристы'),
              ),
            ),
            const SizedBox(height: 8), // Расстояние между специальностями
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Обработчик нажатия кнопки выбора специальности
                },
                child: const Text('Программисты'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Обработчик нажатия кнопки выбора специальности
                },
                child: const Text('Инженеры'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Обработчик нажатия кнопки выбора специальности
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

@override
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
            'Выберите группу в каторой вы учитесь:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Обработчик нажатия кнопки выбора специальности
            },
            child: const Text('Юристы'),
          ),
          ElevatedButton(
            onPressed: () {
              // Обработчик нажатия кнопки выбора специальности
            },
            child: const Text('Программисты'),
          ),
          ElevatedButton(
            onPressed: () {
              // Обработчик нажатия кнопки выбора специальности
            },
            child: const Text('Инженеры'),
          ),
          ElevatedButton(
            onPressed: () {
              // Обработчик нажатия кнопки выбора специальности
            },
            child: const Text('Философы'),
          ),
        ],
      ),
    ),
  );
}
