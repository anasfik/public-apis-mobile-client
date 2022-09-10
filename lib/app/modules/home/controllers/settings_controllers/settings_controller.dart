import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/setting_option_model.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/widgets/nil.dart';

import '../../../../utils/text_helper_methods.dart';
import '../../views/settings_view/widgets/settings_widgets/toggle_categories_view.dart';
import 'sub_settings/reset_favorites_setting.dart';

class SettingsController extends GetxController {
  SettingsController() {
    settings = [
      SettingOptionModel(
        title: TextHelperMethods.firstLettersToCapital("categories"),
        icon: Icons.grid_view,
        optionFunction: () {},
        settingsWidget: ToggleCategoriesView(),
      ),
      SettingOptionModel(
        title: TextHelperMethods.firstLettersToCapital("reset favorites"),
        icon: Icons.grid_view,
        optionFunction: () {
          Get.find<ResetFavoritesController>()
              .openConfirmDialogToDeleteFavorites();
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
