import 'package:get/get.dart';

import '../controllers/settings_controllers/settings_controller.dart';
import '../controllers/settings_controllers/sub_settings/category_box__setting_controller.dart';
import '../controllers/settings_controllers/sub_settings/reset_favorites_setting_controller.dart';
import '../controllers/settings_controllers/sub_settings/themes_buttons_setting_controller.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingsController>(
      SettingsController(),
    );
    Get.lazyPut<ToggleCategoriesController>(
      () => ToggleCategoriesController(),
    );
    Get.lazyPut<ResetFavoritesController>(
      () => ResetFavoritesController(
        context: Get.overlayContext,
      ),
    );
    Get.lazyPut<ThemesButtonsSettingController>(
      () => ThemesButtonsSettingController(),
    );
  }
}
