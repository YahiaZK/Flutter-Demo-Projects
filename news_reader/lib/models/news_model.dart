import 'package:flutter/material.dart';

import 'article.dart';

class NewsResponse {
  final int totalResults;
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
