import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/waiting_screen.dart';

void main() {
  testWidgets('WaitingScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: WaitingScreen()));

    // Проверяем наличие виджетов и их свойств

    // Проверяем наличие контейнера с белым фоном
    expect(find.byType(Container), findsOneWidget);
    final container = tester.widget<Container>(find.byType(Container));
    expect(container.color, Colors.white);

    // Проверяем наличие SingleChildScrollView
    expect(find.byType(SingleChildScrollView), findsOneWidget);

    // Проверяем наличие логотипа приложения (Image.network)
    expect(find.byType(Image), findsOneWidget);
    final image = tester.widget<Image>(find.byType(Image));
    expect(image.image, isA<NetworkImage>());
    expect(image.fit, BoxFit.contain);

    // Проверяем наличие кнопок и их свойств
    expect(find.byType(ElevatedButton), findsNWidgets(2));
    final loginButton =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton).at(0));
    // ignore: unused_local_variable
    final registrationButton =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton).at(1));
    expect(loginButton.style?.foregroundColor, Colors.black);
    expect(loginButton.style?.backgroundColor, Colors.white);

    expect(registrationButton.style?.foregroundColor, Colors.white);
    expect(registrationButton.style?.backgroundColor, const Color(0xFF4C6ED7));
    expect(registrationButton.style?.shape,
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)));
  });
}
