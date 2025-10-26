class Article {
  final String author;
  final String title;
  final String description;
  final String? urlToImage;
  final String date;

  const Article({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.date,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] ?? 'no author',
      title: json['title'] ?? 'no title',
      description: json['description'] ?? 'no description',
      urlToImage: json['urlToImage'],
      date: json['publishedAt'],
    );
  }
}
