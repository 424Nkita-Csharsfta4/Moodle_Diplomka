import 'package:flutter/material.dart';
import 'pages/welcome.dart';
import '../components/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Регистрация Moodle',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        duration: 3, // Длительность отображения прелоадера в секундах
        navigateAfterSeconds:
            WelcomePage(), // Страница, на которую перейти после прелоадера
        imagePath: '../assets/logo.png', // Путь к вашему логотипу
        backgroundColor: Colors.white, // Цвет фона прелоадера
        photoSize: 100.0, // Размер логотипа прелоадера
        loaderColor: Colors.blue, // Цвет прелоадера
      ),
    );
  }
}
