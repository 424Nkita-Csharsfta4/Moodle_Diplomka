import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/input-group.dart';

void main() {
  testWidgets('GroupSelectionScreen widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GroupSelectionScreen(),
      ),
    );

    final groupNumberTextFieldFinder = find.byType(TextField);
    final startButtonFinder = find.byType(ElevatedButton);

    expect(groupNumberTextFieldFinder, findsOneWidget);
    expect(startButtonFinder, findsOneWidget);

    // Test initial error message
    expect(find.text('Введите существующую группу'), findsNothing);

    // Test validation error message
    await tester.enterText(groupNumberTextFieldFinder, '123');
    await tester.tap(startButtonFinder);
    await tester.pump();

    expect(find.text('Введите существующую группу'), findsOneWidget);

    // Test successful navigation
    await tester.enterText(groupNumberTextFieldFinder, '111');
    await tester.tap(startButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('Next Screen'), findsOneWidget);
    expect(find.text('This is the next screen.'), findsOneWidget);
  });
}
