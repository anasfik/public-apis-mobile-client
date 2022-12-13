import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/home_controller.dart';

extension StateUpdatersExtension on HomeController {
    void updateColor(ColorTween clr) {
    badgeBackgroundColor.value = badgeBackgroundColorTween.value.begin;
  }

  void updateHomeCategoriesGrid() {
    update([categoriesGridViewId]);
  }

}