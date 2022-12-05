import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/favoriteApi.dart';

abstract class BoxesConstants {
  static const String favorites = "favorites";
  static const String locals = "locals";
  BoxesConstants._();
}

class HiveBoxes {
  static Box<FavoriteApi> favoritesBox =
      Hive.box<FavoriteApi>(BoxesConstants.favorites);
  static Box localsBox = Hive.box(BoxesConstants.locals);
  HiveBoxes._();
}
