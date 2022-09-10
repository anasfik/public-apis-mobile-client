import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/themes.dart';
import '../../home_controller.dart';

class ThemesButtonsSettingController extends GetxController {
  // locals box
  Box localsBox = Hive.box("locals");

  // the list of bool
  late List<bool> themesViewBool;
  late List<Color> colors;
  @override
  void onInit() {
    // init the categoriesViewBool list
    themesViewBool = localsBox.get("themesViewBool") ??
        [
          true,
          false,
          false,
          false,
        ];
    colors = [
      AppColors.purple,
      AppColors.brown,
      AppColors.green,
      AppColors.orange,
    ];
    super.onInit();
  }

  // change theme method
  void chooseTheme({
    required Color color,
    required int index,
  }) {
    // fill bool list with false
    themesViewBool.fillRange(0, themesViewBool.length, false);

    // change the true value
    themesViewBool[index] = true;

    // and the main change theme
    Get.changeTheme(AppThemes.themeDataBasedOnColor(color));

    // then save the bool list
    localsBox.put("themesViewBool", themesViewBool);

    // and save that color
    localsBox.put("lastSavedThemeColorValue", color.value);

    // don't forget to update the badge bg since it's getted from a separate controller
    Get.find<HomeController>().badgeBackgroundColor.value = color;
  }
}
