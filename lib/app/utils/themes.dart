import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'colors/Colors_helper.dart';
import 'colors/colors.dart';

class AppThemes {
  // Get the locals box
  static Box localsBox = Hive.box("locals");

  // Get the lastSaved Color to theme the app with it, if it's null, then use the default color which is the purple
  static int lastSavedThemeColorValue =
      localsBox.get("lastSavedThemeColorValue") ?? AppColors.purple.value;
  static Color lastSavedThemeColor = Color(lastSavedThemeColorValue);

  // Set it
  static ThemeData lightTheme = themeDataBasedOnColor(
    lastSavedThemeColor,
  );

  // themeData method
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
    );

    return theme;
  }
}
