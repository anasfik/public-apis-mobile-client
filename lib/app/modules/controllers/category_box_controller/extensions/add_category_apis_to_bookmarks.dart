import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/add_all_apis_list_to_bookmarks.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/favorites_db.dart';

extension AddCategoryApisToBookmark on CategoryBoxController {
  FavoritesController get _favoritesController =>
      Get.find<FavoritesController>();

  FavoritesDB get favorites => FavoritesDB.instance;

  Future<void> addAllApisToBookmarks() async {
    final data = CategoryBoxController.currentCategoryData;
    final category = data!.title;
    _favoritesController.addAllApisToBookmarks(data!.apis, category);
  }
}
