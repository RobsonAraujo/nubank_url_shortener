import 'package:flutter/foundation.dart';
import '../models/shortened_url.dart';
import '../services/url_shortener_service.dart';
import '../services/storage_service.dart';

class UrlShortenerProvider with ChangeNotifier {
  final UrlShortenerService _urlService = UrlShortenerService();
  final StorageService _storageService = StorageService();

  List<ShortenedUrl> _shortenedUrls = [];
  bool _isLoading = false;
  String? _error;

  List<ShortenedUrl> get shortenedUrls => _shortenedUrls;
  bool get isLoading => _isLoading;
  String? get error => _error;

  UrlShortenerProvider() {
    _loadShortenedUrls();
  }

  Future<void> _loadShortenedUrls() async {
    try {
      _shortenedUrls = await _storageService.getShortenedUrls();
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load shortened URLs: $e';
      notifyListeners();
    }
  }

  Future<void> shortenUrl(String url) async {
    if (url.trim().isEmpty) {
      _error = 'Please enter a valid URL';
      notifyListeners();
      return;
    }

    // Clean and validate URL
    final cleanedUrl = _cleanAndValidateUrl(url);
    if (cleanedUrl == null) {
      _error = 'Please enter a valid URL (e.g., https://example.com)';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final shortenedUrl = await _urlService.shortenUrl(cleanedUrl);
      await _storageService.addShortenedUrl(shortenedUrl);
      await _loadShortenedUrls();
    } catch (e) {
      _error = 'Failed to shorten URL: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  String? _cleanAndValidateUrl(String url) {
    // Remove whitespace
    url = url.trim();
    
    // Add protocol if missing
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      url = 'https://$url';
    }
    
    try {
      final uri = Uri.parse(url);
      // Ensure it's a valid HTTP/HTTPS URL
      if (uri.scheme == 'http' || uri.scheme == 'https') {
        return url;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
} 