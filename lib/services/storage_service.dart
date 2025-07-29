import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/shortened_url.dart';

class StorageService {
  static const String _key = 'shortened_urls';

  Future<void> saveShortenedUrls(List<ShortenedUrl> urls) async {
    final prefs = await SharedPreferences.getInstance();
    final urlsJson = urls.map((url) => url.toJson()).toList();
    await prefs.setString(_key, jsonEncode(urlsJson));
  }

  Future<List<ShortenedUrl>> getShortenedUrls() async {
    final prefs = await SharedPreferences.getInstance();
    final urlsString = prefs.getString(_key);
    
    if (urlsString == null) return [];
    
    try {
      final urlsJson = jsonDecode(urlsString) as List;
      return urlsJson
          .map((json) => ShortenedUrl.fromStorageJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> addShortenedUrl(ShortenedUrl url) async {
    final urls = await getShortenedUrls();
    urls.insert(0, url); // Add to the beginning
    await saveShortenedUrls(urls);
  }
} 