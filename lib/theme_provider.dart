import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

  class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider () {
    _themeData = ThemeData.light(); 
    _loadTheme();
  }

  ThemeData getTheme() => _themeData;

  void toggleTheme() {
    _themeData =
        _themeData == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    _saveTheme();
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  void _saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _themeData == ThemeData.dark());
  }
}

class SharedPreferences {
  static getInstance() {}
  
  void setBool(String s, bool bool) {}
  
  getBool(String s) {}
}
