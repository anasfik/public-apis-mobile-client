import 'package:get/get.dart';

import '../controllers/settings_controllers/settings_controller.dart';
import '../controllers/settings_controllers/sub_settings/category_box__setting_controller.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingsController>(
      SettingsController(),
    );
    Get.lazyPut<ToggleCategoriesController>(() => ToggleCategoriesController());
  }
}
