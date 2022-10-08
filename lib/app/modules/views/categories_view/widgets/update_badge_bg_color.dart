import 'package:flutter/material.dart';

import '../../../controllers/home_controller/home_controller.dart';

extension UpdateColorExtension on HomeController {
  updateColor(ColorTween clr) {
    badgeBackgroundColor.value = badgeBackgroundColorTween.value.begin;
  }
}