import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Colors.teal;

  static final lightTheme = ThemeData(
    // Font Family
    fontFamily: 'Poppins',
  ).copyWith(
    // Primary Color
    primaryColor: primaryColor,

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),

    //Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      elevation: 0,
      focusColor: primaryColor.withOpacity(0.8),
    ),
  );
}
