import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/setting_option_model.dart';

import '../../views/settings_view/widgets/settings_widgets/toggle_categories_view.dart';

class SettingsController extends GetxController {
  SettingsController() {
    settings = [
      SettingOptionModel(
        title: "categories view",
        icon: Icons.grid_view,
        optionFunction: () {},
        settingsWidget: ToggleCategoriesView(),
      ),
      SettingOptionModel(
        title: "categories view",
        icon: Icons.grid_view,
        optionFunction: () {},
        settingsWidget: ToggleCategoriesView(),
      )
    ];
  }
  late List<SettingOptionModel> settings;
  late List<bool> isOpenedList = List.filled(settings.length, false);

  void toggleExpansionTile({
    required int index,
    required bool isExpanded,
  }) {
    isOpenedList = List.filled(settings.length, false);
    isOpenedList[index] = !isExpanded;
    update();
  }
}
