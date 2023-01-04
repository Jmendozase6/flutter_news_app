import 'package:flutter/material.dart';
import 'package:news_production_app/presentation/screens/screens.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  MaintenanceScreen.routeName: (context) => const MaintenanceScreen(),
  SearchScreen.routeName: (context) => const SearchScreen(),
};
