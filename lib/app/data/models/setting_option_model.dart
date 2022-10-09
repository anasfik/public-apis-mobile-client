import 'package:flutter/material.dart';

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
}

extension BoolExtensionChecks on SettingOptionModel {
  bool get isResetSetting => title.toLowerCase().contains("reset");
  bool get isPrivacySetting => title.toLowerCase().contains("privacy");
  bool get isShareSetting => title.toLowerCase().contains("share");

  bool get shouldNotExpandSettingTile =>
      isResetSetting || isPrivacySetting || isShareSetting;
  bool get shouldExpandSettingTile => !shouldExpandSettingTile;
}
