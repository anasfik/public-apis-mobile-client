import '../../../../data/models/setting_option_model.dart';
import '../settings_controller.dart';

extension HandleExpansionCallBack on SettingsController {
  void handleExpansionCallBack(int index, bool isExpanded) {
    SettingOptionModel currentSettingOption = settings[index];
    currentSettingOption.optionFunction();
    if (currentSettingOption.shouldNotExpandSettingTile) {
      return;
    }
    toggleExpansionTile(
      index,
      isExpanded: isExpanded,
    );
  }
}
