class ShortenedUrl {
  final String alias;
  final String originalUrl;
  final String shortUrl;
  final DateTime createdAt;

  ShortenedUrl({
    required this.alias,
    required this.originalUrl,
    required this.shortUrl,
    required this.createdAt,
  });

  factory ShortenedUrl.fromJson(Map<String, dynamic> json) {
    return ShortenedUrl(
      alias: json['alias'] ?? '',
      originalUrl: json['_links']?['self'] ?? '',
      shortUrl: json['_links']?['short'] ?? '',
      createdAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'alias': alias,
      'originalUrl': originalUrl,
      'shortUrl': shortUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ShortenedUrl.fromStorageJson(Map<String, dynamic> json) {
    return ShortenedUrl(
      alias: json['alias'] ?? '',
      originalUrl: json['originalUrl'] ?? '',
      shortUrl: json['shortUrl'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  @override
  String toString() {
    return 'ShortenedUrl{alias: $alias, originalUrl: $originalUrl, shortUrl: $shortUrl, createdAt: $createdAt}';
  }
} 