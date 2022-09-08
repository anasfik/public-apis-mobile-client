import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../data/models/favoriteApi.dart';

class FavoritesController extends GetxController {
  Box favoritesBox = Hive.box("favorites");

// !  Test
  List<String> writeBoxElementsTitle() {
    return favoritesBox.values
        .map(
          (e) => e.name.toString(),
        )
        .toList();
  }

  toggleFavoriteStatus({
    required bool isFavorite,
    required String name,
    required String category,
    required String description,
    required String auth,
    required String https,
    required String cors,
    required String link,
  }) {
    if (favoritesBox.get("$category$name") != null) {
      removeFromFavorites(
        isFavorite: isFavorite,
        category: category,
        name: name,
      );
      return;
    }

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
    update([name]);
  }

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
