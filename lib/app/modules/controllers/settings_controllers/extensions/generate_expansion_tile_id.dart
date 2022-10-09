import '../settings_controller.dart';

extension GenerateExpansionTileIdExtension on SettingsController {
  String generateExpansionTileId(int index) {
  return "ExpansionTile$index";
}

}