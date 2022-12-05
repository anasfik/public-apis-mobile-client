import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

import '../../../../data/models/favoriteApi.dart';

extension AddToFavoritesExtension on FavoritesController {
  /// Add api to favorites hive box.
  void addToFavorites({
    required String key,
    required bool isFavorite,
    required FavoriteApi favoriteApi,
  }) {
    final doesFavoriteApiExist = favorites.doesKeyExist(key);
    if (!doesFavoriteApiExist) {
      favorites.putWithKey(key, favoriteApi);
      isFavorite = true;
    }
  }
}
