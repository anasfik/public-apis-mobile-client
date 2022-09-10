import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/setting_option_model.dart';

import '../../../utils/text_helper_methods.dart';
import '../../views/settings_view/widgets/settings_widgets/themes_buttons_view.dart';
import '../../views/settings_view/widgets/settings_widgets/toggle_categories_view.dart';
import 'sub_settings/reset_favorites_setting_controller.dart';

class SettingsController extends GetxController {
  SettingsController() {
    settings = [
      SettingOptionModel(
        title: TextHelperMethods.firstLettersToCapital("change Themes"),
        icon: Icons.palette_outlined,
        optionFunction: () {},
        settingsWidget: ThemesButtons(),
      ),
      SettingOptionModel(
        title: TextHelperMethods.firstLettersToCapital("categories view"),
        icon: Icons.grid_view_outlined,
        optionFunction: () {},
        settingsWidget: ToggleCategoriesView(),
      ),
      SettingOptionModel(
        title: TextHelperMethods.firstLettersToCapital("reset favorites"),
        icon: Icons.bookmark_remove_outlined,
        optionFunction: () {
          Get.find<ResetFavoritesController>()
              .openConfirmDialogToDeleteFavorites();
        },
        settingsWidget: const SizedBox(),
      ),
      SettingOptionModel(
        title: TextHelperMethods.firstLettersToCapital("Privacy"),
        icon: Icons.shield_outlined,
        optionFunction: () {
          Get.toNamed("/privacy");
        },
        settingsWidget: const SizedBox(),
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
