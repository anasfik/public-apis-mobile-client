import 'package:flutter/painting.dart';

Color hex(String color) {
  String colorString = color.replaceAll('#', '');
  late int colorInt;
  final isValidHexFormat = _isValidHexColorFormat(color);
  // Case of #FFFFFF.
  if (isValidHexFormat && colorString.length == 6) {
    colorInt = int.parse(
      colorString,
      radix: 16,
    );

    return Color(colorInt + 0xFF000000);
  }

  // Case of #FFF.
  if (isValidHexFormat && colorString.length == 3) {
    String doubledString = colorString * 2;
    colorInt = int.parse(
      doubledString,
      radix: 16,
    );

    return Color(colorInt + 0xFF000000);
  }

  throw Exception('Invalid hex color format');
}

bool _isValidHexColorFormat(String color) {
  final hexCodeWithoutHashTag = color.substring(1, color.length);

  final hasLengthOfSex = hexCodeWithoutHashTag.length == 3;
  final hasLengthOfThree = hexCodeWithoutHashTag.length == 6;
  final hasLengthOfEight = hexCodeWithoutHashTag.length == 8;

  return color.startsWith("#") &&
      (hasLengthOfThree || hasLengthOfEight || hasLengthOfSex);
}
