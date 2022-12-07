import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/services/local_db/interfaces/add_to_db_like_list.dart';
import 'package:public_apis_desktop_client/app/services/local_db/interfaces/database_key_existence_checker.dart';
import 'package:public_apis_desktop_client/app/services/local_db/interfaces/delete_with_key.dart';
import 'package:public_apis_desktop_client/app/services/local_db/interfaces/value_listenable.dart';
import '../interfaces/clear.dart';
import '../interfaces/database_elements_length.dart';
import '../interfaces/empty_checker.dart';
import 'constants/boxes.dart';

class HiddenCategoriesDB
    implements
        ClearDatabase,
        AddWithoutKey,
        KeyExistenceChecker,
        EmptyChecker,
        DatabaseElementsLength,
        ListenableHive,
        DeleteWithKey {
  static final _instance = HiddenCategoriesDB._();
  static HiddenCategoriesDB get instance => _instance;

  @override
  bool get isEmpty => HiveBoxes.hiddenCategoriesBox.isEmpty;
  @override
  int get length => HiveBoxes.hiddenCategoriesBox.length;

  HiddenCategoriesDB._();

  @override
  Future<int> clear() {
    return HiveBoxes.hiddenCategoriesBox.clear();
  }

  @override
  bool doesKeyExist(String value) {
    return HiveBoxes.hiddenCategoriesBox.values.contains(value.toLowerCase());
  }

  @override
  listenable() {
    return HiveBoxes.hiddenCategoriesBox.listenable();
  }

  @override
  Future<void> deleteWithKey(String key) {
    return HiveBoxes.hiddenCategoriesBox.delete(key);
  }

  @override
  Future<void> addWithoutKey(String value) {
    final keyAndValue = value.toLowerCase();

    return HiveBoxes.hiddenCategoriesBox.put(keyAndValue, keyAndValue);
  }
}
