import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../data/models/favoriteApi.dart';

class FavoritesController extends GetxController {
  // ! Variables
  // Get favorites box
  Box favoritesBox = Hive.box<FavoriteApi>("favorites");



 


}
