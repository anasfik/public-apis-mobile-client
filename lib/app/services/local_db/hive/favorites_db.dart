import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/data/models/favoriteApi.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/constants/boxes.dart';
import 'package:public_apis_desktop_client/app/services/local_db/interfaces/delete_with_key.dart';
import 'package:public_apis_desktop_client/app/services/local_db/interfaces/value_listenable.dart';

import '../interfaces/box_type.dart';
import '../interfaces/database_key_existence_checker.dart';

class FavoritesDB
    implements KeyExistenceChecker, DeleteWithKey, ListenableHive, BoxType {
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
  Future<void> putWithKey(String key, value) async {
    return HiveBoxes.favoritesBox.put(key, value);
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
