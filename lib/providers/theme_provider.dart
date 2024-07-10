import 'package:flutter/material.dart';
import 'package:planner/themes/light_theme.dart';
import 'package:planner/themes/dark_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get getTheme => _themeData;

  void setLightTheme() {
    _themeData = lightTheme;
    notifyListeners();
  }

  void setDarkTheme() {
    _themeData = darkTheme;
    notifyListeners();
  }
}
