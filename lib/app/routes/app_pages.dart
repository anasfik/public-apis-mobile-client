import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/views/privacy_view/privacy_view.dart';

import '../modules/bindings/favorites_view_binding.dart';
import '../modules/bindings/home_binding.dart';
import '../modules/bindings/privacy_bindings.dart';
import '../modules/bindings/settings_binding.dart';
import '../modules/views/categories_view/home_categories_view.dart';
import '../modules/views/favorites_view/favorites_view.dart';
import '../modules/views/settings_view/settings_view.dart';

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
    GetPage(
      name: _Paths.privacyPath,
      page: () => PrivacyView(),
      binding: PrivacyBinding(),
    ),
  ];
}
