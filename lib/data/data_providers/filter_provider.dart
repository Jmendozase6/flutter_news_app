import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  String _selectedFilter = 'publishedAt';

  String get selectedFilter => _selectedFilter;

  set selectedFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }
}
