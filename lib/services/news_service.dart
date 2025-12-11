import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  static const String apiKey = '51e89eea090943a9ac091b8006fcb257';
  static const String baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchGlobalNews({String? category}) async {
    final query = category != null && category.isNotEmpty ? category : 'breaking';
    final url = Uri.parse(
        '$baseUrl/everything?q=$query&sortBy=publishedAt&language=en&apiKey=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List articlesJson = data['articles'];
      return articlesJson.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news: ${response.statusCode}');
    }
  }
}
