import 'package:get/get.dart';

import '../controllers/category_box_controller/category_box_controller.dart';
import '../controllers/category_box_controller/close_button_controller.dart';
import '../controllers/favorites_controller/favorites_controller.dart';
import '../controllers/home_controller/home_controller.dart';

class HomeCategoriesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(context: Get.context));
    Get.lazyPut(() => CategoryBoxController());
    Get.lazyPut(() => CloseButtonController());
  }
}
