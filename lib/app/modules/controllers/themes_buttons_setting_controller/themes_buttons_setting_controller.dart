import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/locals_box.dart';
import 'package:public_apis_desktop_client/app/utils/extensions/list_extension.dart';

import '../../../utils/colors/colors.dart';
import '../../../utils/themes.dart';
import '../home_controller/home_controller.dart';

class ThemesButtonsSettingController extends GetxController {
  LocalsDB locals = LocalsDB.instance;

  Duration selectingAnimationDuration = const Duration(milliseconds: 100);
  Curve selectingAnimationCurve = Curves.easeInOutQuad;

  List<bool>? themeOptionSelectedBool;
  List<Color>? colors;

  bool get hasOnlyOneSelectedOption =>
      themeOptionSelectedBool.containsOnlyOnce(true);

  HomeController get homeController {
    if (GetInstance().isRegistered<HomeController>()) {
      return Get.find<HomeController>();
    }

    return Get.put(HomeController(context: Get.context!));
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
    locals.putWithKey("themesViewBool", themeOptionSelectedBool);
    locals.putWithKey("lastSavedThemeColorValue", color.value);
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
    return locals.getWithKey("themesViewBool") ??
        List<bool>.generate(
          colors?.length ?? 0,
          (index) => index == AppThemes().defaultThemColorIndex,
        );
  }
}
