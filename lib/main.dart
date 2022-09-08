import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/data/models/favoriteApi.dart';
import 'package:public_apis_desktop_client/app/utils/themes.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(FavoriteApiAdapter());
  Box favoritesBox = await Hive.openBox("favorites");

  await favoritesBox.clear();

  runApp(
    GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.homeCategoriesView,
      getPages: AppPages.routes,
      theme: AppThemes.lightTheme,
    ),
  );
}
