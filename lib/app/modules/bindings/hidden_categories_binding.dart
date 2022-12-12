import 'package:get/get.dart';

import '../controllers/hidden_categories_controller/hidden_categories_controller.dart';

class HiddenCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HiddenCategoriesController>(
      HiddenCategoriesController(),
    );
    }

}