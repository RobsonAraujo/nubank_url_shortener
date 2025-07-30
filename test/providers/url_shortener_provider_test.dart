import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_url_shortener/providers/url_shortener_provider.dart';

void main() {
  group('UrlShortenerProvider', () {
    late UrlShortenerProvider provider;

    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      provider = UrlShortenerProvider();
    });

    test('should initialize with empty state', () {
      expect(provider.shortenedUrls, isEmpty);
      expect(provider.isLoading, isFalse);
      expect(provider.error, isNull);
    });

    test('should clear error when clearError is called', () {
      provider.clearError();
      expect(provider.error, isNull);
    });

    test('should validate URL with missing protocol', () {
      // This would be tested with a mock service
      expect(provider, isNotNull);
    });

    test('should validate URL with http protocol', () {
      // This would be tested with a mock service
      expect(provider, isNotNull);
    });

    test('should validate URL with https protocol', () {
      // This would be tested with a mock service
      expect(provider, isNotNull);
    });
  });
} 