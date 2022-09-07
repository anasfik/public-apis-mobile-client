import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/utils/themes.dart';

import 'app/routes/app_pages.dart';

void main() {
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
