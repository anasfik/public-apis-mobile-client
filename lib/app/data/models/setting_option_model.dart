import 'package:flutter/material.dart';

class SettingOptionModel {
  String title;
  IconData icon;
  void Function() optionFunction;

  SettingOptionModel({
    required this.title,
    required this.icon,
    required this.optionFunction,
  });
}
