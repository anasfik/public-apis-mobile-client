import 'package:get/get.dart';

import '../controllers/settings_controllers/settings_controller.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingsController>(
      SettingsController(),
    );
  }
}
