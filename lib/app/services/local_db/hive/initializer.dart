import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/constants/boxes.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/hidden_categories_db.dart';

import '../../../data/models/favoriteApi.dart';
import 'favorites_db.dart';
import 'locals_box.dart';

class LocalDatabase {
  static final _instance = LocalDatabase._();
  static LocalDatabase get instance => _instance;
  LocalDatabase._();

  Future<void> initDatabases() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FavoriteApiAdapter());
    final ignore = await Future.wait(
      <Future>[
        Hive.openBox<FavoriteApi>(BoxesConstants.favorites),
        Hive.openBox(BoxesConstants.locals),
        Hive.openBox(BoxesConstants.hiddenCategories),
      ],
    );
  }

  Future<void> clearDatabasesWhile([bool condition = false]) async {
    LocalsDB favorites = LocalsDB.instance;
    FavoritesDB locals = FavoritesDB.instance;
    HiddenCategoriesDB hiddenCategories = HiddenCategoriesDB.instance;

    if (condition) {
      final ct = await favorites.clear();
      final ft = await locals.clear();
      final ht = await hiddenCategories.clear();
      print("Cleared $ct favorites and $ft locals and $ht hidden categories");
    }
  }
}
