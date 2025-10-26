import 'package:hive/hive.dart';

import 'article.dart';

part 'news_model.g.dart';

@HiveType(typeId: 0)
class NewsResponse {
  @HiveField(0)
  final int totalResults;
  @HiveField(1)
  final List<Article> articles;
  const NewsResponse({required this.totalResults, required this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    final articleListFromJson = json['articles'] as List;
    List<Article> articleList = articleListFromJson
        .map((articleJson) => Article.fromJson(articleJson))
        .toList();

    return NewsResponse(
      totalResults: json['totalResults'],
      articles: articleList,
    );
  }
}
