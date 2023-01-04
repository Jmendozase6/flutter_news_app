import 'package:flutter/material.dart';

class CountryProvider extends ChangeNotifier {
  String _selectedCountry = 'Estados Unidos';

  String get selectedCountry => _selectedCountry;

  set selectedCountry(String country) {
    _selectedCountry = country;
    notifyListeners();
  }
}
