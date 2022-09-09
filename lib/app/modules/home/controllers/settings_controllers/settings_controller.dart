import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/setting_option_model.dart';

class SettingsController extends GetxController {
  List<SettingOptionModel> settings = [
    SettingOptionModel(
      title: "change categories view",
      icon: Icons.grid_view,
      optionFunction: () {},
    )
  ];
}
