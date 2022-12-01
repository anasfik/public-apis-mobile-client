import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'colors/colors_helper.dart';
import 'colors/colors.dart';

class AppThemes {
  static final _instance = AppThemes._();

  int get defaultThemColorIndex => 2;
  Box get localsBox => Hive.box("locals");

  Color get defaultThemeColor => AppColors.themeColors[defaultThemColorIndex];

  int get lastSavedThemeColorValue =>
      localsBox.get("lastSavedThemeColorValue") ?? defaultThemeColor.value;

  Color get lastSavedThemeColor => Color(lastSavedThemeColorValue);

  ThemeData get lightTheme => themeDataBasedOnColor(lastSavedThemeColor);

  factory AppThemes() {
    return _instance;
  }
  AppThemes._();
  
  static ThemeData themeDataBasedOnColor(Color color) {
    ThemeData theme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: hex("#161616"),
      primaryColor: color,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        headline2: TextStyle(
          color: hex("#161616"),
          fontSize: 24,
        ),
        headline3: const TextStyle(
          letterSpacing: 1.5,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        headline5: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        bodyText2: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: color,
        secondary: color,
      ),
      dialogBackgroundColor: hex("#ecf0f1"),
    );

    return theme;
  }
}
