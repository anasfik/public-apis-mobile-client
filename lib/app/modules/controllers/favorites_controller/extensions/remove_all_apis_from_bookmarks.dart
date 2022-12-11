import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/generate_api_key.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/remove_from_favorites.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

import '../../../../data/models/AllApis.dart';

extension RemoveAllApisOfCategoryFromBookmarksExtension on FavoritesController {
  Future<void> removeAllApisOfCategoryFromBookmarks(
    List<Api> apis,
    String category,
  ) async {
    final startingTextKey = startingKey(category);

    for (int index = 0; index < apis.length; index += 1) {
      final currentApi = apis[index];
      final apiName = currentApi.name;
      final apiConsistentKey = consistentKey(category, apiName);

      await Future.delayed(
        const Duration(
          milliseconds: 30,
        ),
      );

      removeFromFavorites(
        key: apiConsistentKey,
        isFavorite: true,
      );
    }
    // return favorites.deleteKeysStartingWithString(startingTextKey);
  }
}
