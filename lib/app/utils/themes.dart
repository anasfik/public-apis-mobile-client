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
    ),
  );
}
