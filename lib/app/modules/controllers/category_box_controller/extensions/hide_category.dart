import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/update_home_categories_grid.dart';

import '../../../../services/local_db/hive/hidden_categories_db.dart';
import '../category_box_controller.dart';

extension HideCategoryExtension on CategoryBoxController {
  Future<void> hideCategory() async {
    final currentCategoryData = CategoryBoxController.currentCategoryData;
    final categoryTitle = currentCategoryData!.title;
    _addToHiddenCategoriesDatabase(categoryTitle);
    updateHomeCategoriesGrid();
    }

  Future<void> showCategory() async {
    final currentCategoryData = CategoryBoxController.currentCategoryData;
    final categoryTitle = currentCategoryData!.title;
    _removeFromHiddenCategoriesDatabase(categoryTitle);
    updateHomeCategoriesGrid();
  }

  void _removeFromHiddenCategoriesDatabase(String category) {
    HiddenCategoriesDB.instance.deleteWithKey(category);
  }

  void _addToHiddenCategoriesDatabase(String category) {
    HiddenCategoriesDB.instance.addWithoutKey(category);
  }
}
