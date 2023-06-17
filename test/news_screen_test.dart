// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'dart:convert';

import 'package:my_app/news_screen.dart';

// import 'package:path_to_file/news_screen.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
  });

  testWidgets('Fetches news from API and displays them',
      (WidgetTester tester) async {
    final newsList = [
      {
        'title': 'News 1',
        'author': 'Author 1',
        'image': 'https://example.com/image1.jpg',
      },
      {
        'title': 'News 2',
        'author': 'Author 2',
        'image': 'https://example.com/image2.jpg',
      },
    ];

    final response = http.Response(jsonEncode({'news': newsList}), 200);

    when(mockHttpClient.get(Uri.parse('http://example.com/api/news')))
        .thenAnswer((_) async => response);

    await tester.pumpWidget(
      const MaterialApp(
        home: NewsScreen(username: 'test_user'),
      ),
    );

    // Wait for the news to be fetched and displayed
    await tester.pumpAndSettle();

    // Verify that the news articles are displayed
    expect(find.text('News 1'), findsOneWidget);
    expect(find.text('Author 1'), findsOneWidget);
    expect(find.text('News 2'), findsOneWidget);
    expect(find.text('Author 2'), findsOneWidget);

    // Verify that the news article images are displayed
    expect(
        find.byWidgetPredicate(
            (widget) => widget is Image && widget.image is NetworkImage),
        findsNWidgets(2));

    // Verify that the API was called with the correct URL
    verify(mockHttpClient.get(Uri.parse('http://example.com/api/news')))
        .called(1);
  });
}
