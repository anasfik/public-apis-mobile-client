import 'package:public_apis_desktop_client/app/services/local_db/hive/boxes.dart';

import '../impl.dart';

class LocalsDB implements LocalDataImpl {
  static final LocalsDB _instance = LocalsDB._();
  static LocalsDB get instance => _instance;

  LocalsDB._();

  @override
  dynamic getWithKey(String key) {
    return HiveBoxes.localsBox.get(key);
  }

  @override
  void putWithKey(String key, value) {
    HiveBoxes.localsBox.put(key, value);
  }

  @override
  Future<int> clear() async {
    return HiveBoxes.localsBox.clear();
  }
}
