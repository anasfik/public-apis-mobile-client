import 'package:public_apis_desktop_client/app/services/local_db/hive/interfaces/delete_with_key.dart';
import 'package:public_apis_desktop_client/app/services/local_db/impl.dart';

import 'constants/boxes.dart';

class HiddenCategoriesDB implements  LocalDataImpl, DeleteWithKey {
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
