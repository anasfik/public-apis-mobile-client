import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/utils/themes.dart';
import 'app/services/main_init_service.dart/main_init.dart';

import 'app/modules/controllers/settings_controllers/sub_settings_controllers/themes_buttons_setting_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await MainInit().init();
  runApp(const PublicApisApp());
}

class PublicApisApp extends StatelessWidget {
  const PublicApisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder.put(
        () => ThemesButtonsSettingController(),
      ),
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      title: "Public Apis",
      initialRoute: Routes.homeCategoriesView,
      getPages: AppPages.routes,
      theme: AppThemes().lightTheme,
    );
  }
}

