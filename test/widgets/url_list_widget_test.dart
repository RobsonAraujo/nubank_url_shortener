import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:nubank_url_shortener/widgets/url_list_widget.dart';
import 'package:nubank_url_shortener/providers/url_shortener_provider.dart';
import 'package:nubank_url_shortener/models/shortened_url.dart';

void main() {
  group('UrlListWidget', () {
    late UrlShortenerProvider provider;

    setUp(() {
      provider = UrlShortenerProvider();
    });

    Widget createTestWidget() {
      return MaterialApp(
        home: ChangeNotifierProvider<UrlShortenerProvider>.value(
          value: provider,
          child: const Scaffold(
            body: UrlListWidget(),
          ),
        ),
      );
    }

    testWidgets('should display empty state when no URLs exist', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(find.text('No shortened URLs yet'), findsOneWidget);
      expect(find.text('Shorten your first URL to see it here'), findsOneWidget);
      expect(find.byIcon(Icons.link_off), findsOneWidget);
    });

    testWidgets('should display URLs when they exist', (WidgetTester tester) async {
      // Arrange
      final testUrl = ShortenedUrl(
        alias: 'test123',
        originalUrl: 'https://example.com',
        shortUrl: 'https://short.url/test123',
        createdAt: DateTime.now(),
      );
      
      // Act
      await tester.pumpWidget(createTestWidget());
      
      // Simulate adding a URL to the provider
      provider.shortenedUrls.add(testUrl);
      provider.notifyListeners();
      await tester.pump();

      // Assert
      expect(find.text('Alias: test123'), findsOneWidget);
      expect(find.text('https://example.com'), findsOneWidget);
      expect(find.text('https://short.url/test123'), findsOneWidget);
    });

    testWidgets('should display copy and open buttons', (WidgetTester tester) async {
      // Arrange
      final testUrl = ShortenedUrl(
        alias: 'test123',
        originalUrl: 'https://example.com',
        shortUrl: 'https://short.url/test123',
        createdAt: DateTime.now(),
      );
      
      // Act
      await tester.pumpWidget(createTestWidget());
      provider.shortenedUrls.add(testUrl);
      provider.notifyListeners();
      await tester.pump();

      // Assert
      expect(find.byIcon(Icons.copy), findsOneWidget);
      expect(find.byIcon(Icons.open_in_new), findsOneWidget);
    });

    testWidgets('should display multiple URLs in list', (WidgetTester tester) async {
      // Arrange
      final testUrls = [
        ShortenedUrl(
          alias: 'test1',
          originalUrl: 'https://example1.com',
          shortUrl: 'https://short.url/test1',
          createdAt: DateTime.now(),
        ),
        ShortenedUrl(
          alias: 'test2',
          originalUrl: 'https://example2.com',
          shortUrl: 'https://short.url/test2',
          createdAt: DateTime.now(),
        ),
      ];
      
      // Act
      await tester.pumpWidget(createTestWidget());
      provider.shortenedUrls.addAll(testUrls);
      provider.notifyListeners();
      await tester.pump();

      // Assert
      expect(find.text('Alias: test1'), findsOneWidget);
      expect(find.text('Alias: test2'), findsOneWidget);
      expect(find.byType(Card), findsNWidgets(2));
    });
  });
} 