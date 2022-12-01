import 'package:get/get.dart';

import '../controllers/favorites_controller/favorites_controller.dart';
import '../controllers/home_controller/home_controller.dart';

class HomeCategoriesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        context: Get.context,
      ),
    );

  }
}
