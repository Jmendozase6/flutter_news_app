import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  String _selectedCategory = 'general';

  String get selectecCategory => _selectedCategory;

  set selectecCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
