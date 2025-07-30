import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/shortened_url.dart';

class UrlShortenerService {
  static const String _baseUrl = 'https://url-shortener-server.onrender.com/api/alias';

  Future<ShortenedUrl> shortenUrl(String url) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'url': url}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return ShortenedUrl.fromJson(data);
      } else {
        throw Exception('Failed to shorten URL: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<String> getOriginalUrl(String alias) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/$alias'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['url'] ?? '';
      } else if (response.statusCode == 404) {
        throw Exception('Alias not found');
      } else {
        throw Exception('Failed to get original URL: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
} 