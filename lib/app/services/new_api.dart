import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class NewsService {
  static const String apiKey = 'f495adcbdf28ad96fdf954a0df47a539';
  static const String baseUrl = 'https://newsapi.org/v2/top-headlines';
  static const String category = 'entertainment';

  Future<List<Article>> getEntertainmentNews() async {
    final response = await http.get(
      Uri.parse('$baseUrl?country=in&category=$category&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 'ok') {
        final List<dynamic> articles = data['articles'];
        return articles.map((article) => Article.fromJson(article)).toList();
      }
    }

    throw Exception('Failed to load entertainment news');
  }
}
