import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/hidden_categories_db.dart';

import '../../../data/models/AllApis.dart';

class HiddenCategoriesController extends GetxController {
  String HiddenCategoriesGrdId = "HiddenCategoriesGrid";
  HiddenCategoriesDB hiddenCategories = HiddenCategoriesDB.instance;

  List<CategoryApis> filterHiddenCategories(List<CategoryApis> list) {
    List<CategoryApis> hiddenCategoriesResult = [];

    for (int index = 0; index < list.length; index++) {
      final current = list[index];
      final currentCategory = current.title;
      final isHidden = hiddenCategories.doesKeyExist(currentCategory);
      if (isHidden) {
        hiddenCategoriesResult.add(current);
      }
    }

    return hiddenCategoriesResult;
  }

  void updateHiddenCategoriesGrid() {
    update([HiddenCategoriesGrdId]);
  }
}
