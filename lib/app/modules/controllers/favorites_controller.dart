import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/models/favoriteApi.dart';

class FavoritesController extends GetxController {
  // ! Variables

  // Get favorites box
  Box favoritesBox = Hive.box<FavoriteApi>("favorites");

// // !  Test
// // TODO: remove on release
//   List<String> writeBoxElementsTitle() {
//     return favoritesBox.values
//         .map(
//           (e) => e.name.toString(),
//         )
//         .toList();
//   }

  // Add/Remove favorite api from favorites box
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
      _removeFromFavorites(
        isFavorite: isFavorite,
        category: category,
        name: name,
      );
      return;
    }

    // else (isFavorite = false), then add it to the box
    _addToFavoritesList(
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

  // Add api to favoritesBox
  void _addToFavoritesList({
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

  // Remove api from favoritesBox
  void _removeFromFavorites({
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
