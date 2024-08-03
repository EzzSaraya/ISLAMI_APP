import "package:flutter/material.dart";
import 'package:islami_app/app_colors.dart';
class MyThemeData {
  static final ThemeData LightTheme = ThemeData(
    primaryColor: AppColors.PrimaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.BlackColor,
        unselectedItemColor: AppColors.WhiteColor,
        backgroundColor: AppColors.PrimaryLightColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 40,
        color: AppColors.BlackColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}