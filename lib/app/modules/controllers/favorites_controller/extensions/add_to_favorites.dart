import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

import '../../../../data/models/favoriteApi.dart';

extension AddToFavoritesExtension on FavoritesController {
  /// Add api to favorites hive box
  void addToFavoritesList({
    required bool isFavorite,
    required String name,
    required String category,
    required String description,
    required String auth,
    required String https,
    required String cors,
    required String link,
  }) {
    if (favoritesBox.get("$category$name") == null) {
      favoritesBox.put(
        "$category$name",
        FavoriteApi(
          name: name,
          category: category,
          description: description,
          auth: auth,
          https: https,
          cors: cors,
          link: link,
        ),
      );
      isFavorite = true;
    }
    // update the GetBuilder of the widget with the name id
    update([name]);
  }
}
