import 'package:flutter/material.dart';

class Appconfigprovider extends ChangeNotifier {
  String appLang = 'en';
  ThemeMode appTheme = ThemeMode.system;

  void changeLanguage(String newLang) {
    if (appLang == newLang) {
      return;
    }
    appLang = newLang;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isdark() {
    return appTheme == ThemeMode.dark;
  }
}
