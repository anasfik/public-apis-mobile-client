class KeyGenerator {
  // This will be used to get specific apis of a category from a database of different apis.
  static String startingKey(category) {
    return "$category";
  }

  /// Generate api key which is used to store the api in the favorites box.
  static String consistentKey(String category, String name) {
    return "${startingKey(category)}$name";
  }

  KeyGenerator._();
}
