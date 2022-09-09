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
