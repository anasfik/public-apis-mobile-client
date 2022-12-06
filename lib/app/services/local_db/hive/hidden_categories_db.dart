import 'package:public_apis_desktop_client/app/services/local_db/interfaces/add_to_db_like_list.dart';
import 'package:public_apis_desktop_client/app/services/local_db/interfaces/database_key_existence_checker.dart';
import '../interfaces/clear.dart';
import '../interfaces/empty_checker.dart';
import 'constants/boxes.dart';

class HiddenCategoriesDB
    implements ClearDatabase, AddWithoutKey, KeyExistenceChecker, EmptyChecker {
  static final _instance = HiddenCategoriesDB._();
  static HiddenCategoriesDB get instance => _instance;
  @override
  bool get isEmpty => HiveBoxes.hiddenCategoriesBox.isEmpty;
  HiddenCategoriesDB._();

  @override
  Future<int> clear() {
    return HiveBoxes.hiddenCategoriesBox.clear();
  }

  @override
  Future<void> addWithoutKey(String value) {
    return HiveBoxes.hiddenCategoriesBox.add(value.toLowerCase());
  }

  @override
  bool doesKeyExist(String value) {
    return HiveBoxes.hiddenCategoriesBox.values.contains(value.toLowerCase());
  }
}
