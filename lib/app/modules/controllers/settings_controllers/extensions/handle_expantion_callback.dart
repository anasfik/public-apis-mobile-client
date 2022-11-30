import '../../../../data/models/setting_option_model.dart';
import '../settings_controller.dart';

extension HandleExpansionCallBack on SettingsController {
  void handleExpansionCallBack(int index, bool isExpanded) {
    SettingOptionModel currentSettingOption = settingModelAt(index);
    currentSettingOption.optionFunction.call();

    if (currentSettingOption.shouldNotExpandSettingTile) {
      return;
    }
    toggleExpansionTile(
      index,
      isExpanded: isExpanded,
    );
  }

  SettingOptionModel settingModelAt(int index) {
    return settings?[index] ?? SettingOptionModel.errorNotifier();
  }
}
