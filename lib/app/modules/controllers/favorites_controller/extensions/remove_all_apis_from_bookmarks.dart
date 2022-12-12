import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/generate_api_key.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/remove_from_favorites.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

import '../../../../data/models/AllApis.dart';
import '../../../../services/key_generators/keys_generators.dart';

extension RemoveAllApisOfCategoryFromBookmarksExtension on FavoritesController {
  Future<void> removeAllApisOfCategoryFromBookmarks(
    List<Api> apis,
    String category,
  ) async {

    for (int index = 0; index < apis.length; index += 1) {
      final currentApi = apis[index];
      final apiName = currentApi.name;
      final apiConsistentKey = KeyGenerator.consistentKey(category, apiName);

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
    // final startingTextKey = startingKey(category);
    // return favorites.deleteKeysStartingWithString(startingTextKey);
  }
}
