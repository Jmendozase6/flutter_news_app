import 'package:flutter/material.dart';

class SearchController extends ChangeNotifier {
  String searchValue = '';
  TextEditingController searchController = TextEditingController();

  void setValue(String value) {
    searchValue = value;
    notifyListeners();
  }
}
