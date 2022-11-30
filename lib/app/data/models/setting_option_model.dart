import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/modules/views/widgets/nil.dart';

class SettingOptionModel {
  String title;
  IconData icon;
  void Function() optionFunction;
  Widget settingsWidget;

  SettingOptionModel({
    required this.title,
    required this.icon,
    required this.optionFunction,
    required this.settingsWidget,
  });

  factory SettingOptionModel.errorNotifier() {
    return SettingOptionModel(
      title: "",
      icon: Icons.error_outline,
      optionFunction: () {},
      settingsWidget: const Nil(),
    );
  }
}

extension BoolExtensionChecks on SettingOptionModel {
  bool get isResetSetting => title.toLowerCase().contains("reset");
  bool get isPrivacySetting => title.toLowerCase().contains("privacy");
  bool get isShareSetting => title.toLowerCase().contains("share");

  bool get shouldNotExpandSettingTile =>
      isResetSetting || isPrivacySetting || isShareSetting;
  bool get shouldExpandSettingTile => !shouldExpandSettingTile;
}
