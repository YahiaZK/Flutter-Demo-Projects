import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/quotes_model.dart';

class QuoteService {
  final String apiKey;
  QuoteService(this.apiKey);

  var baseUrl = 'https://api.api-ninjas.com/v2/randomquotes';

  Future<Quote> getQuote() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {'X-Api-Key': apiKey},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      print(jsonList[0]);
      return Quote.fromJson(jsonList[0]);
    } else {
      throw Exception('Faild to make request ');
    }
  }
}
