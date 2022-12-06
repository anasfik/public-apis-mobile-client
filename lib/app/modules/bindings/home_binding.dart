import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

import '../controllers/category_box_controller/category_box_controller.dart';
import '../controllers/category_box_controller/category_box_option_tile_controller.dart';
import '../controllers/category_box_controller/close_button_controller.dart';
import '../controllers/home_controller/home_controller.dart';

class HomeCategoriesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(context: Get.context));
    Get.put<FavoritesController>(FavoritesController());
    Get.lazyPut(() => CategoryBoxController(), fenix: true);
    Get.lazyPut(() => CloseButtonController());
    Get.lazyPut(() => CategoryBoxOptionTileController());
  }
}
