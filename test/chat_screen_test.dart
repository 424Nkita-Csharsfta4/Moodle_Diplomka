import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: unused_import
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:my_app/user.dart';
import 'package:my_app/chat_screen.dart';

void main() {
  testWidgets('ChatScreen widget test', (WidgetTester tester) async {
    final user = User(
      'John',
      name: 'John',
      surname: 'Doe',
      avatar: '',
      email: '',
      friendsCount: 0,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ChatScreen(user: user),
      ),
    );

    expect(find.text('Chat with John Doe'), findsOneWidget);

    final sendButtonFinder = find.byIcon(Icons.send);
    final textFieldFinder = find.byType(TextField);

    expect(sendButtonFinder, findsOneWidget);
    expect(textFieldFinder, findsOneWidget);

    await tester.enterText(textFieldFinder, 'Hello');
    expect(find.text('Hello'), findsOneWidget);

    await tester.tap(sendButtonFinder);
    await tester.pump();

    // Here you can add more assertions based on the expected behavior of your ChatScreen component

    // For example, you can assert the presence of a sent message in the message list
    final messageFinder = find.text('Hello');
    expect(messageFinder, findsOneWidget);
  });
}
