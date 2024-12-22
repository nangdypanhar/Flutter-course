import 'package:expense_tracker/Theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme;
  ThemeData get themeData => _themeData;
  bool isDarkMode = false;

  void toggleTheme() {
    if (_themeData == AppTheme.lightTheme) {
      _themeData = AppTheme.darkTheme;
      isDarkMode = true;
    } else {
      _themeData = AppTheme.lightTheme;
      isDarkMode = false;
    }
    notifyListeners();
  }
}
