import '../../../../services/local_db/hive/hidden_categories_db.dart';
import '../category_box_controller.dart';

extension HideCategoryExtension on CategoryBoxController {
  Future<void> hideCategory() async {
    if (CategoryBoxController.currentCategoryData == null) {
      return;
    }
  }

  void _addToHiddednDatabase() {
// HiddenCategoriesDB.instance.add
  }
}
