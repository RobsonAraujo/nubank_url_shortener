import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/url_shortener_provider.dart';

class UrlInputWidget extends StatefulWidget {
  const UrlInputWidget({super.key});

  @override
  State<UrlInputWidget> createState() => _UrlInputWidgetState();
}

class _UrlInputWidgetState extends State<UrlInputWidget> {
  final TextEditingController _urlController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _urlController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UrlShortenerProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildUrlTextField(provider),
              const SizedBox(height: 16),
              _buildShortenButton(provider),
              if (provider.error != null) ...[
                const SizedBox(height: 8),
                _buildErrorWidget(provider),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildUrlTextField(UrlShortenerProvider provider) {
    return TextField(
      controller: _urlController,
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: 'Enter URL to shorten',
        hintText: 'https://example.com',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: _buildClearButton(provider),
      ),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => _handleShortenUrl(provider),
    );
  }

  Widget _buildClearButton(UrlShortenerProvider provider) {
    return IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        _urlController.clear();
        provider.clearError();
      },
    );
  }

  Widget _buildShortenButton(UrlShortenerProvider provider) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: provider.isLoading ? null : () => _handleShortenUrl(provider),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: _buildButtonContent(provider),
      ),
    );
  }

  Widget _buildButtonContent(UrlShortenerProvider provider) {
    if (provider.isLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
    
    return const Text(
      'Shorten URL',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildErrorWidget(UrlShortenerProvider provider) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade600, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              provider.error!,
              style: TextStyle(color: Colors.red.shade700),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.red.shade600, size: 20),
            onPressed: provider.clearError,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  void _handleShortenUrl(UrlShortenerProvider provider) {
    final url = _urlController.text.trim();
    if (url.isNotEmpty) {
      provider.shortenUrl(url);
      _urlController.clear();
      _focusNode.unfocus();
    }
  }
} 