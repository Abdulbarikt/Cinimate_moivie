import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_api/app/models/article.dart';

class NewsService {
  static const String apiKey = '0dc0c55f2a5e4dcfae8b2a951d87b7a2';
  static const String baseUrl = 'https://newsapi.org/v2/top-headlines';
  static const String category = 'entertainment';

  Future<List<Articles>> getEntertainmentNews() async {
    final response = await http.get(
      Uri.parse('$baseUrl?country=in&category=$category&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 'ok') {
        final List<dynamic> articles = data['articles'];
        return articles.map((article) => Articles.fromJson(article)).toList();
      }
    }

    throw Exception('Failed to load entertainment news');
  }
}
