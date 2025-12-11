import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/article_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    '',
    'technology',
    'business',
    'sports',
    'entertainment',
    'health',
    'science'
  ];

  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: !_isSearching
            ? Text(
          newsProvider.selectedCategory.isEmpty
              ? 'Global News 🌍'
              : '${newsProvider.selectedCategory[0].toUpperCase()}${newsProvider.selectedCategory.substring(1)} News',
        )
            : TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search news...',
            border: InputBorder.none,
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              newsProvider.fetchNews(query: value);
              setState(() => _isSearching = false);
            }
          },
        ),
        actions: [
          if (!_isSearching)
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
            ),
          if (_isSearching)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _isSearching = false;
                  _searchController.clear();
                  newsProvider.fetchNews();
                });
              },
            ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Theme.of(context).colorScheme.surface,
              value: newsProvider.selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(
                    category.isEmpty
                        ? 'All'
                        : category[0].toUpperCase() + category.substring(1),
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  newsProvider.fetchNews(category: value);
                }
              },
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: themeProvider.isDarkMode
                ? 'Switch to Light Mode'
                : 'Switch to Dark Mode',
            onPressed: () {
              themeProvider.toggleTheme(!themeProvider.isDarkMode);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: newsProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : newsProvider.error.isNotEmpty
          ? Center(child: Text(newsProvider.error))
          : ListView.builder(
        itemCount: newsProvider.articles.length,
        itemBuilder: (context, index) {
          return ArticleCard(article: newsProvider.articles[index]);
        },
      ),
    );
  }
}
