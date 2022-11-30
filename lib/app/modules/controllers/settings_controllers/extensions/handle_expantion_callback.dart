import '../../../../data/models/setting_option_model.dart';
import '../settings_controller.dart';

extension HandleExpansionCallBack on SettingsController {
  void handleExpansionCallBack(int index, bool isExpanded) {
    SettingOptionModel currentSettingOption = _settingModelAt(index);
    currentSettingOption.optionFunction.call();

    if (currentSettingOption.shouldExpandSettingTile) {
      toggleExpansionTile(
        index,
        isExpanded: isExpanded,
      );
    }
  }

  SettingOptionModel _settingModelAt(int index) {
    return settings?[index] ?? SettingOptionModel.errorNotifier();
  }
}
