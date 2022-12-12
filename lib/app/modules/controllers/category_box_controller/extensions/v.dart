import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';

import '../../hidden_categories_controller/hidden_categories_controller.dart';

extension UpdateHiddenCategoriesGridExtension on CategoryBoxController {
  void updateHiddenCategoriesGrid() {
    final hiddenCategoriesController = Get.find<HiddenCategoriesController>();
    hiddenCategoriesController.updateHiddenCategoriesGrid();
  }
}
