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

Future<void> initAppServices() async {
  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    Hive.initFlutter(),
  ]);
}

Future<void> opnHiveBoxes() async {
  await Future.wait([
    Hive.openBox<FavoriteApi>("favorites"),
    Hive.openBox("locals"),
  ]);
}

Future<void> clearHiveBoxesInDebugMode() async {
  // favorites box
  Box favoritesBox = Hive.box<FavoriteApi>("favorites");
  // locals box
  Box localsBox = Hive.box("locals");

  if (kDebugMode) {
    await favoritesBox.clear();
    await localsBox.clear();
  }
}

Future<void> mainInit() async {
  await initAppServices();
  Hive.registerAdapter(FavoriteApiAdapter());
  await opnHiveBoxes();

  await clearHiveBoxesInDebugMode();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mainInit();
  FlutterError.onError = Crashlytics().crashlyticsInstance.recordFlutterError;
  runApp(
    GetMaterialApp(
      initialBinding:
          BindingsBuilder.put(() => ThemesButtonsSettingController()),
      debugShowCheckedModeBanner: false,
      title: "Public Apis",
      initialRoute: AppPages.homeCategoriesView,
      getPages: AppPages.routes,
      theme: AppThemes.lightTheme,
    ),
  );
}
