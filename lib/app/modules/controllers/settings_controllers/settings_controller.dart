import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/setting_option_model.dart';
import 'package:share_plus/share_plus.dart';

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
        settingsWidget: const ThemesButtons(),
      ),
      SettingOptionModel(
        title: TextHelperMethods.firstLettersToCapital("categories view"),
        icon: Icons.grid_view_outlined,
        optionFunction: () {},
        settingsWidget: const ToggleCategoriesView(),
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
        title: TextHelperMethods.firstLettersToCapital("privacy"),
        icon: Icons.shield_outlined,
        optionFunction: () {
          Get.toNamed("/privacy");
        },
        settingsWidget: const SizedBox(),
      ),
      SettingOptionModel(
        title: TextHelperMethods.firstLettersToCapital("share"),
        icon: Icons.share_outlined,
        optionFunction: () async {
          // TODO: add share link
          ShareResult share = await Share.shareWithResult(
            r'Discover over than 1400+ free api to use, ${add link here}',
          );

          print(share.status.name);
        },
        settingsWidget: const SizedBox(),
      ),
    ];
  }

  // Settings list
  late List<SettingOptionModel> settings;

  // bool list responsible to toggle expansion panels
  late List<bool> isOpenedList = List.filled(settings.length, false);

  // toggle expansion panels method
  void toggleExpansionTile({
    required int index,
    required bool isExpanded,
  }) {
    isOpenedList = List.filled(settings.length, false);
    isOpenedList[index] = !isExpanded;
    update();
  }
}
