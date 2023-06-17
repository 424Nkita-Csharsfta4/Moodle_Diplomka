import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main_ribbon.dart';
// import 'package:my_app/news_feed_screen.dart';

void main() {
  testWidgets('NewsFeedScreen widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: NewsFeedScreen(),
      ),
    );

    final appBarTitleFinder = find.text('Лента новостей');
    final centerTextFinder = find.text('Здесь будет ваша лента новостей');

    expect(appBarTitleFinder, findsOneWidget);
    expect(centerTextFinder, findsOneWidget);
    expect(centerTextFinder,
        matchesGoldenFile('golden_files/news_feed_screen.png'));
  });
}
