import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/setting_option_model.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/settings_controllers/extensions/settings_option_models_list_extension.dart';

class SettingsController extends GetxController {
  SettingsController() {
    settings = settingsOptionModelsList();
  }

  late List<SettingOptionModel> settings;

  // bool list responsible to toggle expansion panels
  late List<bool> expansionTilesOpenStatus =
      List.filled(settings.length, false);

  final String settingsViewId = "settingsViewId";

  // toggle expansion panels method
  void toggleExpansionTile(
    int index, {
    required bool isExpanded,
  }) {
    expansionTilesOpenStatus = List.filled(settings.length, false);
    expansionTilesOpenStatus[index] = !isExpanded;
    update([settingsViewId]);
  }
}

