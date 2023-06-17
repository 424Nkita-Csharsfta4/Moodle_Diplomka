import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/friends.dart';

void main() {
  testWidgets('ListTileExample widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ListTileExample(),
      ),
    );

    final tile0Finder = find.text('Tile 0: basic');
    final tile1Finder = find.text('Tile 1: with leading/trailing widgets');
    final tile2Finder = find.text('Tile 2 title');
    final tile3Finder = find.text('Tile 3: 3 lines');
    final tile4Finder = find.text('Tile 4: dense');
    final tile5Finder = find.text('Tile5: tile with badge');

    expect(tile0Finder, findsOneWidget);
    expect(tile1Finder, findsOneWidget);
    expect(tile2Finder, findsOneWidget);
    expect(tile3Finder, findsOneWidget);
    expect(tile4Finder, findsOneWidget);
    expect(tile5Finder, findsOneWidget);

    // Example of finding and asserting the presence of specific widgets within a ListTile
    final tile1LeadingIconFinder = find.descendant(
      of: tile1Finder,
      matching: find.byIcon(Icons.face),
    );
    expect(tile1LeadingIconFinder, findsOneWidget);

    final tile1TrailingIconFinder = find.descendant(
      of: tile1Finder,
      matching: find.byIcon(Icons.tag_faces),
    );
    expect(tile1TrailingIconFinder, findsOneWidget);

    final tile5BadgeFinder = find.descendant(
      of: tile5Finder,
      matching: find.byType(Badge),
    );
    expect(tile5BadgeFinder, findsOneWidget);
  });
}
