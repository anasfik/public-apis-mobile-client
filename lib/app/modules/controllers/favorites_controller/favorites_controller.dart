import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../data/models/favoriteApi.dart';

class FavoritesController extends GetxController {
  // Get favorites box.
  Box<FavoriteApi> favoritesBox = Hive.box<FavoriteApi>("favorites");
}
