import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/setting_option_model.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/settings_controllers/mixins/settings_option_models_list.dart';

class SettingsController extends GetxController
    with SettingsOptionModelsListExtension {
  List<SettingOptionModel>? settings;

  List<bool>? expansionTilesOpenStatus;

  final String settingsViewId = "settingsViewId";

  SettingsController() {
    settings = settingsOptionModelsList();
  }

  void toggleExpansionTile(
    int index, {
    required bool isExpanded,
  }) {
    expansionTilesOpenStatus = _listOfFalse();
    _toggleExpansionAt(index, !isExpanded);
    _updateSettingUI();
  }

  void _toggleExpansionAt(int index, bool newValue) {
    expansionTilesOpenStatus?[index] = !newValue;
  }

  void _updateSettingUI() {
    update([settingsViewId]);
  }

  List<bool> _listOfFalse() {
    return List.filled(settings?.length ?? 0, false);
  }
}
