import 'package:get/get.dart';

import '../controllers/settings_controllers/settings_controller.dart';
import '../controllers/category_box__setting_controller/category_box__setting_controller.dart';
import '../controllers/reset_favorites_setting_controller/reset_favorites_setting_controller.dart';
import '../controllers/share_app_controller/share_app_controller.dart';
import '../controllers/themes_buttons_setting_controller/themes_buttons_setting_controller.dart';

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
    Get.lazyPut<ShareAppController>(
      () => ShareAppController(),
    );
  }
}
