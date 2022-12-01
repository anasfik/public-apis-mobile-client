import '../favorites_controller.dart';

extension GenerateApiKeyExtension on FavoritesController {
  /// Generate api key which is used to store the api in the favorites box.
  String consistentKey(String category, String name) {
    return "$category$name";
  }
}
