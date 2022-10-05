import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/add_to_favorites.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/remove_from_favorites.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

extension ToggleFavoriteStatusExtension on FavoritesController {
  
  /// Add / Remove favorite api from favorites box
  void toggleFavoriteStatus({
    required bool isFavorite,
    required String name,
    required String category,
    required String description,
    required String auth,
    required String https,
    required String cors,
    required String link,
  }) {
    // When api is found in the box (isFavorite = true)), then remove it and quit
    if (favoritesBox.get("$category$name") != null) {
      removeFromFavorites(
        isFavorite: isFavorite,
        category: category,
        name: name,
      );
      return;
    }

    // else (isFavorite = false), then add it to the box
    addToFavoritesList(
      isFavorite: isFavorite,
      name: name,
      category: category,
      description: description,
      auth: auth,
      https: https,
      cors: cors,
      link: link,
    );
  }
}