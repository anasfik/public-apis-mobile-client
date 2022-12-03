import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/setting_option_model.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/privacy_controller/privacy_controller.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';
import '../../../views/settings_view/widgets/settings_widgets/themes_buttons_view.dart';
import '../../../views/settings_view/widgets/settings_widgets/toggle_categories_view.dart';
import '../../reset_favorites_setting_controller/reset_favorites_setting_controller.dart';
import '../../share_app_controller/share_app_controller.dart';

mixin SettingsOptionModelsListExtension {
  ResetFavoritesController get resetFavoritesController =>
      Get.find<ResetFavoritesController>();
  PrivacyController get privacyController => Get.find<PrivacyController>();
  ShareAppController get shareAppController => Get.find<ShareAppController>();

  List<SettingOptionModel> settingsOptionModelsList() {
    return [
      SettingOptionModel(
        title: "change Themes".capitalizeAllWordsFirstLetter(),
        icon: Icons.palette_outlined,
        settingsWidget: const ThemesButtons(),
      ),
      SettingOptionModel(
        title: "categories view".capitalizeAllWordsFirstLetter(),
        icon: Icons.grid_view_outlined,
        settingsWidget: const ToggleCategoriesView(),
      ),
      SettingOptionModel(
        title: "reset favorites".capitalizeAllWordsFirstLetter(),
        icon: Icons.bookmark_remove_outlined,
        optionFunction: () {
          resetFavoritesController.openConfirmDialogToDeleteFavorites();
        },
      ),
      SettingOptionModel(
        title: "privacy".capitalizeAllWordsFirstLetter(),
        icon: Icons.shield_outlined,
        optionFunction: () {
          privacyController.navigateToPrivacyPage();
        },
      ),
      SettingOptionModel(
        title: "share".capitalizeAllWordsFirstLetter(),
        icon: Icons.share_outlined,
        optionFunction: () async {
          shareAppController.shareApp();
        },
      ),
    ];
  }
}
