import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_url_shortener/main.dart';

void main() {
  group('URL Shortener App Integration Tests', () {
    testWidgets('should display app title', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.text('URL Shortener'), findsOneWidget);
    });

    testWidgets('should display URL input field', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.text('Enter URL to shorten'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('should display shorten button', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.text('Shorten URL'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should display recent URLs section', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.text('Recent Shortened URLs'), findsOneWidget);
    });

    testWidgets('should show empty state when no URLs exist', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.text('No shortened URLs yet'), findsOneWidget);
      expect(find.text('Shorten your first URL to see it here'), findsOneWidget);
    });

    testWidgets('should allow entering URL text', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());
      await tester.enterText(find.byType(TextField), 'https://example.com');

      // Assert
      expect(find.byType(TextField), findsOneWidget);
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text, 'https://example.com');
    });

    testWidgets('should clear input when clear button is pressed', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());
      await tester.enterText(find.byType(TextField), 'https://example.com');
      await tester.tap(find.byIcon(Icons.clear));
      await tester.pump();

      // Assert
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text, '');
    });

    testWidgets('should have proper app structure', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Column), findsWidgets);
    });
  });
} 