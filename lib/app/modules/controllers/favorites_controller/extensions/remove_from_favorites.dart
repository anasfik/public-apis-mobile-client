import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

extension RemoveFromFavorites on FavoritesController {
  /// Remove api from favorites hive box
  void removeFromFavorites({
    required bool isFavorite,
    required String category,
    required String name,
  }) {
    if (favoritesBox.get("$category$name") != null) {
      favoritesBox.delete("$category$name");
      isFavorite = false;
    }
    update([name]);
  }
}