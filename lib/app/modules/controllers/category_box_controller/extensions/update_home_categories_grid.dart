import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/update.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/home_controller.dart';

import '../category_box_controller.dart';

extension UpdateHomeCategoriesGrid on CategoryBoxController {
  Future<void> updateHomeCategoriesGrid() async {
    final homeCategoriesController = Get.find<HomeController>();

    homeCategoriesController.updateHomeCategoriesGrid();
  }
}
