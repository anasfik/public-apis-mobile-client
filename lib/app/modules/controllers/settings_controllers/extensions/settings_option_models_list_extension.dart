import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/setting_option_model.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/settings_controllers/settings_controller.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';
import 'package:share_plus/share_plus.dart';

import '../../../views/settings_view/widgets/settings_widgets/themes_buttons_view.dart';
import '../../../views/settings_view/widgets/settings_widgets/toggle_categories_view.dart';
import '../sub_settings/reset_favorites_setting_controller.dart';

extension SettingsOptionModelsListExtension  on SettingsController {
  settingsOptionModelsList() {
    return [
      SettingOptionModel(
        title: ("change Themes").capitalizeAllWordsFirstLetter(),
        icon: Icons.palette_outlined,
        optionFunction: () {},
        settingsWidget: const ThemesButtons(),
      ),
      SettingOptionModel(
        title: "categories view".capitalizeAllWordsFirstLetter(),
        icon: Icons.grid_view_outlined,
        optionFunction: () {},
        settingsWidget: const ToggleCategoriesView(),
      ),
      SettingOptionModel(
        title: "reset favorites".capitalizeAllWordsFirstLetter(),
        icon: Icons.bookmark_remove_outlined,
        optionFunction: () {
          Get.find<ResetFavoritesController>()
              .openConfirmDialogToDeleteFavorites();
        },
        settingsWidget: const SizedBox(),
      ),
      SettingOptionModel(
        title: ("privacy").capitalizeAllWordsFirstLetter(),
        icon: Icons.shield_outlined,
        optionFunction: () {
          Get.toNamed("/privacy");
        },
        settingsWidget: const SizedBox(),
      ),
      SettingOptionModel(
        title: ("share").capitalizeAllWordsFirstLetter(),
        icon: Icons.share_outlined,
        optionFunction: () async {
          // TODO: add share link
          ShareResult share = await Share.shareWithResult(
            r'Discover over than 1400+ free api to use, Public Apis',
          );
        },
        settingsWidget: const SizedBox(),
      ),
    ];
  }
}
