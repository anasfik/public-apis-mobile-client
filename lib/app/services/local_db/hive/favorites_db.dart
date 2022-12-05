import 'package:public_apis_desktop_client/app/services/local_db/hive/boxes.dart';

import '../impl.dart';

class FavoritesDB implements LocalDataImpl {
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
}
