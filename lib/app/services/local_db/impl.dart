abstract class LocalDataImpl {
  dynamic getWithKey(String key);

  Future<void> putWithKey(String key, dynamic value);

  Future<int> clear();
}
