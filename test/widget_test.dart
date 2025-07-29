import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_url_shortener/main.dart';

void main() {
  testWidgets('URL Shortener app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app starts with the correct title
    expect(find.text('URL Shortener'), findsOneWidget);
    
    // Verify that the URL input field is present
    expect(find.text('Enter URL to shorten'), findsOneWidget);
    
    // Verify that the shorten button is present
    expect(find.text('Shorten URL'), findsOneWidget);
    
    // Verify that the recent URLs section is present
    expect(find.text('Recent Shortened URLs'), findsOneWidget);
  });
}
