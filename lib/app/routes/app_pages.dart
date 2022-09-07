import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/Categories/home_categories_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const homeCategoriesPage = Routes.homeCategoriesPage;

  static final routes = <GetPage>[
    GetPage(
      name: _Paths.homeCategoriesPagePath,
      page: () => HomeCategoriesPage(),
      binding: HomeCategoriesPageBinding(),
    ),
  ];
}
