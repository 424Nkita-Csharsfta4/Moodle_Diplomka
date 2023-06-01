import 'package:flutter/material.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Задаем белый цвет фона
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80), // Добавляем отступ сверху
              // Логотип приложения
              SizedBox(
                width: 200,
                height: 200,
                child: Image.network(
                  'https://sun9-26.userapi.com/impg/BcM9ZJnyLKJi0UktgxUL7h8CkA2ST267KkQqKA/28lOIrfjYRU.jpg?size=224x54&quality=96&sign=f1983bbc9e9ee561cb728867db89e1f6&type=album',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 25),
              // Кнопки
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Вход'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF4C6ED7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    child: const Text('Регистрация'),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Добавляем отступ снизу
            ],
          ),
        ),
      ),
    );
  }
}
