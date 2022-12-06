import 'package:public_apis_desktop_client/app/data/models/favoriteApi.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/add_to_favorites.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/generate_api_key.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

import '../../../../data/models/AllApis.dart';

extension AddApisListToBookmarks on FavoritesController {
  Future<void> addAllApisToBookmarks(List<Api> apis, String category) async {
    for (int index = 0; index < apis.length; index++) {
      final currentApi = apis[index];
      final apiName = currentApi.name;
      final apiConsistentKey = consistentKey(category, apiName);

      addToFavorites(
        key: apiConsistentKey,
        isFavorite: true,
        favoriteApi: FavoriteApi.from(currentApi, category),
      );
    }
  }
}
