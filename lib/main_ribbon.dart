import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const NewsFeedScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лента новостей'),
      ),
      backgroundColor: Colors.white, // Прозрачные элементы iOS-стиля
      body: const Center(
        child: Text(
          'Здесь будет ваша лента новостей',
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue, // Контрастная цветовая схема
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // Прозрачные элементы iOS-стиля
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  // Обработка нажатия на первую вкладку
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.blue, // Контрастная цветовая схема
                ),
              ),
              IconButton(
                onPressed: () {
                  // Обработка нажатия на вторую вкладку
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey, // Контрастная цветовая схема
                ),
              ),
              IconButton(
                onPressed: () {
                  // Обработка нажатия на третью вкладку
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.grey, // Контрастная цветовая схема
                ),
              ),
              IconButton(
                onPressed: () {
                  // Обработка нажатия на четвертую вкладку
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.grey, // Контрастная цветовая схема
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
