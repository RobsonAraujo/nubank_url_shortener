import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  group('API Test', () {
    test('should connect to URL shortener API', () async {
      const url = 'https://docs.flutter.dev/get-started/install/macos/mobile-ios';
      const apiUrl = 'https://url-shortener-server.onrender.com/api/alias';
      
      try {
        print('Testing API connection...');
        print('URL to shorten: $url');
        print('API endpoint: $apiUrl');
        
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({'url': url}),
        );
        
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        
        expect(response.statusCode, anyOf(200, 201));
        
        final data = jsonDecode(response.body);
        expect(data, contains('alias'));
        expect(data, contains('_links'));
        
        print('API test passed!');
      } catch (e) {
        print('API test failed: $e');
        fail('API test failed: $e');
      }
    });
  });
} 