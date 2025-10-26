import 'package:hive/hive.dart';

part 'article.g.dart';

@HiveType(typeId: 1)
class Article {
  @HiveField(0)
  final String author;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String? urlToImage;
  @HiveField(5)
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
