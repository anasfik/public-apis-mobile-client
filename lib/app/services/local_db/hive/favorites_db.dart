import 'package:public_apis_desktop_client/app/services/local_db/hive/boxes.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/delete_with_key.dart';

import '../impl.dart';
import 'database_key_existence_checker.dart';

class FavoritesDB implements LocalDataImpl, KeyExistenceChecker, DeleteWithKey {
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
}
