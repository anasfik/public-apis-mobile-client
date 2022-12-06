import 'package:public_apis_desktop_client/app/services/local_db/interfaces/delete_with_key.dart';
import 'package:public_apis_desktop_client/app/services/local_db/interfaces/put_with_key.dart';

import '../interfaces/clear.dart';
import '../interfaces/get_with_key.dart';
import 'constants/boxes.dart';

class HiddenCategoriesDB
    implements ClearDatabase, DeleteWithKey, PutWithKey, GetWithKey {
  static final _instance = HiddenCategoriesDB._();
  static HiddenCategoriesDB get instance => _instance;
  HiddenCategoriesDB._();

  @override
  Future<int> clear() {
    return HiveBoxes.hiddenCategoriesBox.clear();
  }

  @override
  dynamic getWithKey(String key) {
    return HiveBoxes.hiddenCategoriesBox.get(key);
  }

  @override
  Future<void> putWithKey(String key, value) {
    return HiveBoxes.hiddenCategoriesBox.put(key, value);
  }

  @override
  Future<void> deleteWithKey(String key) {
    return HiveBoxes.hiddenCategoriesBox.delete(key);
  }
}
