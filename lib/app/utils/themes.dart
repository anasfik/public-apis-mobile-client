import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors/Colors_helper.dart';
import 'colors/colors.dart';

class AppThemes {
  static ThemeData? lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: hex("#161616"),
      primaryColor: AppColors.purple,
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
      ),
      colorScheme: ColorScheme.light(
        primary: AppColors.purple,
      ));
}
