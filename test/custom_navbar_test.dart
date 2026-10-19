
import 'package:brihan_bottom_nav/brihan_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders navbar icons', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: CommonNavbar(
            icons: const [
              Icons.home,
              Icons.search,
              Icons.person,
            ],
            selectedIndex: 0,
            onTap: (_) {},
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('calls onTap with selected index', (tester) async {
    int? tappedIndex;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: CommonNavbar(
            icons: const [
              Icons.home,
              Icons.search,
              Icons.person,
            ],
            selectedIndex: 0,
            onTap: (index) => tappedIndex = index,
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.search));

    expect(tappedIndex, 1);
  });

  testWidgets('handles an empty icon list', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: CommonNavbar(
            icons: const [],
            selectedIndex: 0,
            onTap: (_) {},
          ),
        ),
      ),
    );

    expect(find.byType(CommonNavbar), findsOneWidget);
  });
}
