import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/data/models/favoriteApi.dart';
import 'package:public_apis_desktop_client/app/services/crashlytics/crashlytics.dart';
import 'package:public_apis_desktop_client/app/utils/themes.dart';
import 'firebase_options.dart';

import 'app/modules/controllers/settings_controllers/sub_settings/themes_buttons_setting_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = Crashlytics().crashlyticsInstance.recordFlutterError;

  await Hive.initFlutter();

  Hive.registerAdapter(
    FavoriteApiAdapter(),
  );

  // favorites box
  Box favoritesBox = await Hive.openBox<FavoriteApi>("favorites");

  // locals box
  Box localsBox = await Hive.openBox("locals");

  if (kDebugMode) {
    await favoritesBox.clear();
    await localsBox.clear();
  }

  runApp(
    GetMaterialApp(
      initialBinding: BindingsBuilder(
        () {
          Get.put(
            ThemesButtonsSettingController(),
          );
        },
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.homeCategoriesView,
      getPages: AppPages.routes,
      theme: AppThemes.lightTheme,
    ),
  );
}
