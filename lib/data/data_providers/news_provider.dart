import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_production_app/data/models/sort.dart';
import 'package:news_production_app/data/models/models.dart';

const String _urlNews = 'https://newsapi.org/v2';
// const String _originalApiKey = '9fb0f826564741d6baa70755ee32c98b'; // DO NOT MODIFIED
final String _originalApiKey = dotenv.get('NEWS_API', fallback: "");

class NewsProvider extends ChangeNotifier {
  // List Save headlines
  List<Article> headlines = [];
  List<Article> byQuery = [];
  String _selectedCategory = 'general';
  String _selectedCountry = 'us';
  String _selectedFilter = 'publishedAt';
  String query = '';

  bool _isLoading = true;
  Map<String, List<Article>?>? categoryArticles = {};

  NewsProvider() {
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles![item.name] = [];
    }
    getArticlesByCategory();
  }

  // Categories list
  List<Category> categories = [
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  // Sorts list
  List<Sort> filters = [
    Sort(FontAwesomeIcons.clock, 'publishedAt'),
    Sort(FontAwesomeIcons.star, 'relevancy'),
    Sort(FontAwesomeIcons.fire, 'popularity'),
  ];

  bool get isLoading => _isLoading;

  List<Article> get getArticlesSelectedCategory =>
      categoryArticles![_selectedCategory]!;

  getTopHeadlines() async {
    headlines = [];
    final url =
        '$_urlNews/top-headlines?apiKey=$_originalApiKey&country=$_selectedCountry';
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      final newsResponse = newsResponseFromJson(resp.body);
      headlines.addAll(newsResponse.articles);
      notifyListeners();
      // return;
    }
  }

  getArticlesByCategory() async {
    if (categoryArticles![_selectedCategory]!.isNotEmpty) {
      _isLoading = false;
      notifyListeners();
      return categoryArticles![_selectedCategory];
    }

    final url =
        '$_urlNews/top-headlines?apiKey=$_originalApiKey&country=$_selectedCountry&category=$_selectedCategory';
    final resp = await http.get(Uri.parse(url));

    if (resp.statusCode == 200) {
      final newsResponse = newsResponseFromJson(resp.body);
      categoryArticles![_selectedCategory]!.addAll(newsResponse.articles);
      _isLoading = false;
      notifyListeners();
    }
  }

  getArticlesByQuery(String query) async {
    this.query = query;
    byQuery = [];
    final url =
        '$_urlNews/everything?apiKey=$_originalApiKey&q=$query&sortBy=$_selectedFilter';
    final resp = await http.get(Uri.parse(url));

    if (resp.statusCode == 200) {
      final newsResponse = newsResponseFromJson(resp.body);
      byQuery.addAll(newsResponse.articles);
      notifyListeners();
    }
  }

  getArticlesSort(String query) async {
    byQuery = [];
    final url =
        '$_urlNews/everything?apiKey=$_originalApiKey&q=$query&sortBy=$_selectedFilter';
    final resp = await http.get(Uri.parse(url));

    if (resp.statusCode == 200) {
      final newsResponse = newsResponseFromJson(resp.body);
      byQuery.addAll(newsResponse.articles);
      notifyListeners();
    }
  }

  set selectedCategory(String valor) {
    _selectedCategory = valor;
    _isLoading = true;
    getArticlesByCategory();
    notifyListeners();
  }

  set selectedFilter(String valor) {
    _selectedFilter = valor;
    _isLoading = true;
    getArticlesSort(query);
    notifyListeners();
  }

  set selectedCountry(String valor) {
    _selectedCountry = valor;
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles![item.name] = [];
    }
    getArticlesByCategory();
    notifyListeners();
  }
}
