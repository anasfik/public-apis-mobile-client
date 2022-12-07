import '../favorites_controller.dart';

extension GenerateApiKeyExtension on FavoritesController {
  // This will be used to get specific apis of a category from a database of different apis.
  String startingKey(category) {
    return "$category";
  }

  /// Generate api key which is used to store the api in the favorites box.
  String consistentKey(String category, String name) {
    return "${startingKey(category)}$name";
  }
}
