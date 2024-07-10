import 'package:flutter/material.dart';
import 'package:planner/themes/colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.text),
    bodyMedium: TextStyle(color: AppColors.text),
    headlineLarge: TextStyle(color: AppColors.primaryDark),
    headlineSmall: TextStyle(color: AppColors.primaryDark),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.primary,
    titleTextStyle: TextStyle(
      color: AppColors.textLight,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: AppColors.textLight,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.background,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.primaryLight,
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    surface: AppColors.background,
    onPrimary: AppColors.textLight,
    onSecondary: AppColors.text,
    onSurface: AppColors.text,
  ),
);
