import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_url_shortener/models/shortened_url.dart';

void main() {
  group('ShortenedUrl', () {
    test('should create ShortenedUrl with all required fields', () {
      final url = ShortenedUrl(
        alias: 'test123',
        originalUrl: 'https://example.com',
        shortUrl: 'https://short.url/test123',
        createdAt: DateTime(2024, 1, 1),
      );

      expect(url.alias, 'test123');
      expect(url.originalUrl, 'https://example.com');
      expect(url.shortUrl, 'https://short.url/test123');
      expect(url.createdAt, DateTime(2024, 1, 1));
    });

    test('should create ShortenedUrl from JSON', () {
      final json = {
        'alias': 'test123',
        '_links': {
          'self': 'https://example.com',
          'short': 'https://short.url/test123',
        },
      };

      final url = ShortenedUrl.fromJson(json);

      expect(url.alias, 'test123');
      expect(url.originalUrl, 'https://example.com');
      expect(url.shortUrl, 'https://short.url/test123');
      expect(url.createdAt, isA<DateTime>());
    });

    test('should convert ShortenedUrl to JSON', () {
      final url = ShortenedUrl(
        alias: 'test123',
        originalUrl: 'https://example.com',
        shortUrl: 'https://short.url/test123',
        createdAt: DateTime(2024, 1, 1, 12, 0, 0),
      );

      final json = url.toJson();

      expect(json['alias'], 'test123');
      expect(json['originalUrl'], 'https://example.com');
      expect(json['shortUrl'], 'https://short.url/test123');
      expect(json['createdAt'], '2024-01-01T12:00:00.000');
    });

    test('should create ShortenedUrl from storage JSON', () {
      final json = {
        'alias': 'test123',
        'originalUrl': 'https://example.com',
        'shortUrl': 'https://short.url/test123',
        'createdAt': '2024-01-01T12:00:00.000',
      };

      final url = ShortenedUrl.fromStorageJson(json);

      expect(url.alias, 'test123');
      expect(url.originalUrl, 'https://example.com');
      expect(url.shortUrl, 'https://short.url/test123');
      expect(url.createdAt, DateTime(2024, 1, 1, 12, 0, 0));
    });

    test('should handle missing fields in JSON gracefully', () {
      final json = {
        'alias': 'test123',
        '_links': {
          'self': 'https://example.com',
        },
      };

      final url = ShortenedUrl.fromJson(json);

      expect(url.alias, 'test123');
      expect(url.originalUrl, 'https://example.com');
      expect(url.shortUrl, '');
      expect(url.createdAt, isA<DateTime>());
    });

    test('should return proper string representation', () {
      final url = ShortenedUrl(
        alias: 'test123',
        originalUrl: 'https://example.com',
        shortUrl: 'https://short.url/test123',
        createdAt: DateTime(2024, 1, 1),
      );

      final string = url.toString();

      expect(string, contains('test123'));
      expect(string, contains('https://example.com'));
      expect(string, contains('https://short.url/test123'));
    });
  });
} 