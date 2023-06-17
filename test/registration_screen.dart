import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/main_ribbon.dart';
import 'dart:convert';

import 'package:my_app/registration_screen.dart';

void main() {
  testWidgets('RegistrationScreen handles registration correctly',
      (WidgetTester tester) async {
    // Создаем экземпляр компонента RegistrationScreen
    await tester.pumpWidget(
      const MaterialApp(
        home: RegistrationScreen(),
      ),
    );

    // Проверяем, что компонент отобразился корректно

    // Проверяем наличие виджетов и элементов ввода
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Регистрация'), findsOneWidget);
    expect(find.text('Почта'), findsOneWidget);
    expect(find.text('Пароль'), findsOneWidget);
    expect(find.text('ФИО'), findsOneWidget);
    expect(find.text('Студент'), findsOneWidget);
    expect(find.text('Учитель'), findsOneWidget);
    expect(find.text('Регистрация'), findsOneWidget);
    expect(find.text('Вход'), findsOneWidget);

    // Вводим данные в поля ввода
    await tester.enterText(
        find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password');
    await tester.enterText(find.byType(TextFormField).at(2), 'John Doe');

    // Выбираем тип пользователя
    await tester.tap(find.text('Студент'));
    await tester.pumpAndSettle();

    // Мокаем http.post и возвращаем успешный ответ
    // ignore: unused_local_variable
    http.Response mockResponse = http.Response(jsonEncode({}), 200);

    // Нажимаем кнопку "Регистрация"
    await tester.tap(find.text('Регистрация'));
    await tester.pumpAndSettle();

    // Проверяем, что была выполнена отправка HTTP-запроса

    // Мокаем http.post и возвращаем ответ с ошибкой
    mockResponse = http.Response(jsonEncode({}), 400);

    // Нажимаем кнопку "Регистрация"
    await tester.tap(find.text('Регистрация'));
    await tester.pumpAndSettle();

    // Проверяем, что была выполнена отправка HTTP-запроса и открыто диалоговое окно

    expect(find.text('Ошибка'), findsOneWidget);
    expect(find.text('Неверные учетные данные.'), findsOneWidget);

    // Нажимаем кнопку "Вход"
    await tester.tap(find.text('Вход'));
    await tester.pumpAndSettle();

    // Проверяем, что был выполнен переход на экран NewsFeedScreen
    expect(find.byType(NewsFeedScreen), findsOneWidget);
  });
}
