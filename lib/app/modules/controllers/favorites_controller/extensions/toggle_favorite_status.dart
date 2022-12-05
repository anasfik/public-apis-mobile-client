import 'package:public_apis_desktop_client/app/data/models/favoriteApi.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/add_to_favorites.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/generate_api_key.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/remove_from_favorites.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

extension ToggleFavoriteStatusExtension on FavoritesController {
  /// Add / Remove favorite api from favorites box.
  void toggleFavoriteStatus(
    FavoriteApi favoriteApi,
    bool isFavorite,
  ) {
    final id = favoriteApi.name;
    String key = consistentKey(
      favoriteApi.category,
      favoriteApi.name,
    );

    // When api is found in the box (isFavorite = true)), then remove it and quit.
    final doesFavoriteApiExist = favorites.doesKeyExist(key);
    if (doesFavoriteApiExist) {
      removeFromFavorites(
        isFavorite: isFavorite,
        key: key,
      );

      return;
    } else {
      // Else (isFavorite = false), then add it to the box.
      addToFavorites(
        key: key,
        isFavorite: isFavorite,
        favoriteApi: favoriteApi,
      );
    }

    update([id]);
  }
}
