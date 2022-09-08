import 'package:get/get.dart';

import '../controllers/favorites_controller.dart';
import '../controllers/home_controller.dart';

class HomeCategoriesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
    );
    Get.put<FavoritesController>(
      FavoritesController(),
    );
  }
}
