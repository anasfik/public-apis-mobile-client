import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/generate_api_key.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

extension RemoveAllApisOfCategoryFromBookmarksExtension on FavoritesController {
  Future<void> removeAllApisOfCategoryFromBookmarks(String category) async {
    final startingTextKey = startingKey(category);
    
    return favorites.deleteKeysStartingWithString(startingTextKey);
  }
}
