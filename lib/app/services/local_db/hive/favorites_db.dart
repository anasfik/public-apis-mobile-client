import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/data/models/favoriteApi.dart';
import 'package:public_apis_desktop_client/app/services/fetch_api/failure.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/boxes.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/delete_with_key.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/value_listenable.dart';

import '../impl.dart';
import 'box_type.dart';
import 'database_key_existence_checker.dart';

class FavoritesDB
    implements
        LocalDataImpl,
        KeyExistenceChecker,
        DeleteWithKey,
        ListenableHive,
        BoxType {
  @override
  Type boxType = Box<FavoriteApi>;

  static final FavoritesDB _instance = FavoritesDB._();
  static FavoritesDB get instance => _instance;

  FavoritesDB._();

  @override
  dynamic getWithKey(String key) {
    return HiveBoxes.favoritesBox.get(key);
  }

  @override
  void putWithKey(String key, value) {
    HiveBoxes.favoritesBox.put(key, value);
  }

  @override
  Future<int> clear() async {
    return HiveBoxes.favoritesBox.clear();
  }

  @override
  bool doesKeyExist(String key) {
    return getWithKey(key) != null;
  }

  @override
  Future<void> deleteWithKey(String key) {
    return HiveBoxes.favoritesBox.delete(key);
  }

  @override
  ValueListenable<Box<FavoriteApi>> listenable() {
    return HiveBoxes.favoritesBox.listenable();
  }
}
