import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class NewsService {
  final String apiKey;
  NewsService(this.apiKey);

  String baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<NewsResponse> getNewsResponse() async {
    const int pageSize = 100;
    final response = await http.get(
      Uri.parse('$baseUrl?country=us&pageSize=$pageSize&apiKey=$apiKey'),
    );
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}
