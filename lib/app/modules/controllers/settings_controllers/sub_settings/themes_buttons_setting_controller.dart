import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/themes.dart';
import '../../home_controller/home_controller.dart';

class ThemesButtonsSettingController extends GetxController {
  Box localsBox = Hive.box("locals");

  List<bool>? themeOptionSelectedBool;
  List<Color>? colors;

  HomeController get homeController {
    if (GetInstance().isRegistered<HomeController>()) {
      return Get.find<HomeController>();
    }

    return Get.put(HomeController());
  }

  @override
  void onInit() {
    colors = AppColors.themeColors;
    themeOptionSelectedBool = _getListFromLocalOrCreateOne();
    super.onInit();
  }

  void chooseTheme({
    required Color color,
    required int index,
  }) {
    _unselectAllOptions();
    _selectOptionAt(index);
    _changeTheme(color);
    _saveChangesLocally(color);
    _changeBadgeColor(color);
  }

  void _changeBadgeColor(Color color) {
    homeController.badgeBackgroundColorTween.value.begin = color;
    homeController.badgeBackgroundColor.value = color;
  }

  void _saveChangesLocally(Color color) {
    localsBox.put("themesViewBool", themeOptionSelectedBool);
    localsBox.put("lastSavedThemeColorValue", color.value);
  }

  void _changeTheme(Color color) {
    Get.changeTheme(AppThemes.themeDataBasedOnColor(color));
  }

  void _unselectAllOptions() {
    themeOptionSelectedBool?.fillRange(
      0,
      themeOptionSelectedBool?.length ?? 0,
      false,
    );
  }

  void _selectOptionAt(int index) {
    themeOptionSelectedBool?[index] = true;
  }

  List<bool> _getListFromLocalOrCreateOne() {
    return localsBox.get("themesViewBool") ??
        List<bool>.generate(colors?.length ?? 0, (index) => index == 0);
  }
}
