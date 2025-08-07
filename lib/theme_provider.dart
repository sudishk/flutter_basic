import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  bool isDarkMode = false;
  ThemeMode getThemeMode(){
    return  isDarkMode? ThemeMode.dark:ThemeMode.light;
  }
  changeTheme(){
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}