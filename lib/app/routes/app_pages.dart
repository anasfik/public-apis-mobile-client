import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/home/bindings/apis_view_binding.dart';
import 'package:public_apis_desktop_client/app/modules/home/bindings/favorites_view_binding.dart';
import 'package:public_apis_desktop_client/app/modules/home/bindings/settings_binding.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/apis_view/apis_view.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/favorites_view/favorites_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/categories_view/home_categories_view.dart';
import '../modules/home/views/settings_view/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const homeCategoriesView = Routes.homeCategoriesView;

  static final routes = <GetPage>[
    GetPage(
      name: _Paths.homeCategoriesPagePath,
      page: () => const HomeCategoriesPage(),
      binding: HomeCategoriesPageBinding(),
    ),
    GetPage(
      name: _Paths.favoritesViewPath,
      page: () => const FavoritesView(),
      binding: FavoritesViewBinding(),
    ),
    GetPage(
      name: _Paths.settingsViewPath,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
