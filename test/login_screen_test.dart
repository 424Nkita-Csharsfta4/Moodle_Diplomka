import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/login_screen.dart';
import 'package:my_app/news_screen.dart';

void main() {
  testWidgets('LoginScreen widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    final emailFieldFinder = find.byKey(const Key('email_field'));
    final passwordFieldFinder = find.byKey(const Key('password_field'));
    final loginButtonFinder = find.byType(ElevatedButton);

    expect(emailFieldFinder, findsOneWidget);
    expect(passwordFieldFinder, findsOneWidget);
    expect(loginButtonFinder, findsOneWidget);

    // Test empty email and password fields
    await tester.tap(loginButtonFinder);
    await tester.pump();

    expect(find.text('Пожалуйста, введите электронную почту'), findsOneWidget);
    expect(find.text('Пожалуйста, введите пароль'), findsOneWidget);

    // Test valid email and empty password field
    await tester.enterText(emailFieldFinder, 'test@example.com');
    await tester.tap(loginButtonFinder);
    await tester.pump();

    expect(find.text('Пожалуйста, введите пароль'), findsOneWidget);

    // Test empty email and valid password field
    await tester.enterText(emailFieldFinder, '');
    await tester.enterText(passwordFieldFinder, 'test123');
    await tester.tap(loginButtonFinder);
    await tester.pump();

    expect(find.text('Пожалуйста, введите электронную почту'), findsOneWidget);

    // Test valid email and password fields
    await tester.enterText(emailFieldFinder, 'test@example.com');
    await tester.enterText(passwordFieldFinder, 'test123');
    await tester.tap(loginButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(NewsScreen), findsOneWidget);
  });
}
