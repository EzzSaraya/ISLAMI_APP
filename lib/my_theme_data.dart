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
      bodyMedium: TextStyle(
        fontSize: 25,
        color: AppColors.BlackColor,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.BlackColor),
      titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.BlackColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.PrimaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.YellowColor,
        unselectedItemColor: AppColors.WhiteColor,
        backgroundColor: AppColors.PrimaryDarkColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 40,
        color: AppColors.WhiteColor,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        color: AppColors.WhiteColor,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.WhiteColor),
      titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.WhiteColor),
    ),
  );
}