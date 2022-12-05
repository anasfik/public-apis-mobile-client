import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/grid_setting_view.dart';
import '../../../services/local_db/hive/locals_box.dart';
import '../home_controller/home_controller.dart';

class ToggleCategoriesController extends GetxController {
  late List<bool> categoriesViewBool;

  LocalsDB locals = LocalsDB.instance;

  int? temporaryCrossAxisCount;

  final List<GridViewSetting> viewSettings = [
    GridViewSetting(
      icon: Icons.grid_view_rounded,
      isSelected: true,
    ),
    GridViewSetting(
      icon: Icons.view_day,
    ),
  ];

  List<bool> get defaultSettingView {
    return viewSettings.map((viewSetting) => viewSetting.isSelected).toList();
  }

  HomeController get _homeController => Get.find<HomeController>();

  @override
  void onInit() {
    categoriesViewBool = _categoriesViewBoolOrDefault();
    super.onInit();
  }

  void toggleView({required int index, bool shouldGoBackAfterToggle = true}) {
    _unSelectAllViews();
    _selectViewAt(index);

    _saveViewSettingLocally();
    _saveCrossAxisCountValueLocally();
    _changeGridViewCrossAxisCountOnOwnController();
    if (shouldGoBackAfterToggle) {
      Get.back();
    }
  }

  bool hasOnlyOneSelectedView() {
    int selectedViewCount = 0;
    for (int index = 0; index < viewSettings.length; index += 1) {
      bool current = viewSettings[index].isSelected;
      if (current) {
        selectedViewCount++;
        if (selectedViewCount > 1) {
          return false;
        }
      }
    }

    return true;
  }

  void _changeGridViewCrossAxisCountOnOwnController() {
    _homeController.crossAxisCount = temporaryCrossAxisCount ?? 0;
    _homeController.update([_homeController.categoriesGridViewId]);
  }

  void _saveCrossAxisCountValueLocally() {
    temporaryCrossAxisCount = _crossAxisCountValueBasedOnSelectedView();
    locals.putWithKey("crossAxisCount", temporaryCrossAxisCount);
  }

  int _crossAxisCountValueBasedOnSelectedView() {
    return categoriesViewBool.first ? 2 : 1;
  }

  List<bool> _categoriesViewBoolOrDefault() {
    return locals.getWithKey("categoriesViewBool") ?? defaultSettingView;
  }

  void _unSelectAllViews() {
    categoriesViewBool.fillRange(0, categoriesViewBool.length, false);
  }

  void _selectViewAt(int index) {
    categoriesViewBool[index] = true;
  }

  void _saveViewSettingLocally() {
    locals.putWithKey("categoriesViewBool", categoriesViewBool);
  }
}
