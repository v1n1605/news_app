import 'package:flutter/material.dart';
import '../models/article.dart';
import '../services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  final NewsService _newsService = NewsService();

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  bool _loading = false;
  bool get loading => _loading;

  String _error = '';
  String get error => _error;

  String _selectedCategory = '';
  String get selectedCategory => _selectedCategory;

  Future<void> fetchNews({String category = '', String query = ''}) async {
    _loading = true;
    _error = '';
    _selectedCategory = category;
    notifyListeners();

    try {
      if (query.isNotEmpty) {
        _articles = await _newsService.fetchGlobalNews(category: query);
      } else {
        _articles = await _newsService.fetchGlobalNews(
          category: category.isEmpty ? null : category,
        );
      }
    } catch (e) {
      _error = e.toString();
    }

    _loading = false;
    notifyListeners();
  }
}
