import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/news_screen.dart';
// Подставьте путь к файлу user.dart

void main() {
  testWidgets('ProfileScreen displays user information correctly',
      (WidgetTester tester) async {
    // Создаем экземпляр пользователя для теста
    final user = User(
      name: 'John',
      surname: 'Doe',
      avatar: 'https://example.com/avatar.jpg',
      email: 'johndoe@example.com',
      friendsCount: 10,
    );

    // Строим компонент ProfileScreen с использованием тестируемого пользователя
    await tester.pumpWidget(
      MaterialApp(
        home: ProfileScreen(user: user),
      ),
    );

    // Проверяем, что компонент отобразился корректно

    // Проверяем заголовок AppBar
    expect(find.text('John Doe'), findsOneWidget);

    // Проверяем аватар
    expect(find.byType(CircleAvatar), findsOneWidget);
    final avatarWidget = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
    expect(avatarWidget.backgroundImage,
        NetworkImage('https://example.com/avatar.jpg'));
    expect(avatarWidget.radius, 50.0);

    // Проверяем текст имени и фамилии
    expect(find.text('John Doe'), findsOneWidget);
    final nameSurnameText = tester.widget<Text>(find.text('John Doe'));
    expect(nameSurnameText.style?.fontSize, 24.0);
    expect(nameSurnameText.style?.fontWeight, FontWeight.bold);

    // Проверяем текст электронной почты
    expect(find.text('Email: johndoe@example.com'), findsOneWidget);
    final emailText =
        tester.widget<Text>(find.text('Email: johndoe@example.com'));
    expect(emailText.style?.fontSize, 16.0);

    // Проверяем количество друзей
    expect(find.text('Friends: 10'), findsOneWidget);
    final friendsCountText = tester.widget<Text>(find.text('Friends: 10'));
    expect(friendsCountText.style?.fontSize, 16.0);
  });
}
