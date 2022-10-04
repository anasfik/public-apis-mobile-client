import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/services/crashlytics/crashlytics.dart';
import 'package:public_apis_desktop_client/app/utils/themes.dart';
import 'app/services/main_init_service.dart/main_init.dart';

import 'app/modules/controllers/settings_controllers/sub_settings/themes_buttons_setting_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await MainInit().init();
  FlutterError.onError = Crashlytics().crashlyticsInstance.recordFlutterError;
  runApp(PublicApisApp());
}

class PublicApisApp extends StatelessWidget {
  PublicApisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding:
          BindingsBuilder.put(() => ThemesButtonsSettingController()),
      debugShowCheckedModeBanner: false,
      title: "Public Apis",
      initialRoute: AppPages.homeCategoriesView,
      getPages: AppPages.routes,
      theme: AppThemes.lightTheme,
    );
  }
}
