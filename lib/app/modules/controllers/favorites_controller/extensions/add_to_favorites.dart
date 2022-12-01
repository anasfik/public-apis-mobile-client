import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

import '../../../../data/models/favoriteApi.dart';

extension Checks on FavoriteApi? {
  bool get exists => this != null;
}

extension AddToFavoritesExtension on FavoritesController {
  /// Add api to favorites hive box.
  void addToFavoritesList({
    required String key,
    required bool isFavorite,
    required FavoriteApi favoriteApi,
  }) {
    if (!favoritesBox.get(key).exists) {
      favoritesBox.put(
        key,
        favoriteApi,
      );
      isFavorite = true;
    }
   
  }
}
