import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:nubank_url_shortener/widgets/url_input_widget.dart';
import 'package:nubank_url_shortener/providers/url_shortener_provider.dart';

void main() {
  group('UrlInputWidget', () {
    late UrlShortenerProvider provider;

    setUp(() {
      provider = UrlShortenerProvider();
    });

    Widget createTestWidget() {
      return MaterialApp(
        home: ChangeNotifierProvider<UrlShortenerProvider>.value(
          value: provider,
          child: const Scaffold(
            body: UrlInputWidget(),
          ),
        ),
      );
    }

    testWidgets('should display URL input field', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Enter URL to shorten'), findsOneWidget);
    });

    testWidgets('should display shorten button', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(find.text('Shorten URL'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should allow entering URL text', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.enterText(find.byType(TextField), 'https://example.com');

      // Assert
      expect(find.byType(TextField), findsOneWidget);
      // Check that the text field contains the entered text
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text, 'https://example.com');
    });

    testWidgets('should clear input when clear button is pressed', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.enterText(find.byType(TextField), 'https://example.com');
      await tester.tap(find.byIcon(Icons.clear));
      await tester.pump();

      // Assert
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text, '');
    });
  });
} 