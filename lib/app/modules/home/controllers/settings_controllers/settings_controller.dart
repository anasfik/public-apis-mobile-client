import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/setting_option_model.dart';

class SettingsController extends GetxController {
  SettingsController() {
    settings = [
      SettingOptionModel(
        title: "categories view",
        icon: Icons.grid_view,
        optionFunction: () {},
      ),
      SettingOptionModel(
        title: "categories view",
        icon: Icons.grid_view,
        optionFunction: () {},
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
