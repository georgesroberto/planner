import 'package:flutter/material.dart';
import 'package:planner/themes/colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textLight),
    bodyMedium: TextStyle(color: AppColors.textLight),
    headlineLarge: TextStyle(color: AppColors.primaryLight),
    headlineSmall: TextStyle(color: AppColors.primaryLight),
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
    backgroundColor: AppColors.backgroundDark,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.primaryLight,
  ),
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    surface: AppColors.backgroundDark,
    onPrimary: AppColors.textLight,
    onSecondary: AppColors.textLight,
    onSurface: AppColors.textLight,
  ),
);
