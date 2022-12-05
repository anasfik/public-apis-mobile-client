abstract class LocalDataImpl {
  dynamic getWithKey(String key);

  void putWithKey(String key, dynamic value);

  Future<int> clear();
}
