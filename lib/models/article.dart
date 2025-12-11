class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String author;
  final String publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.author,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ??
          'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg',
      author: json['author'] ?? 'Unknown',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}
