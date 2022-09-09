import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/home/controllers/settings_controllers/settings_controller.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/settings_view/widgets/setting_card.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            TextHelperMethods.firstLettersToCapital("settings"),
          ),
        ),
        body: Column(
          children: <Widget>[
            ...List.generate(
              controller.settings.length,
              (index) => SettingsCard(
                settingOption: controller.settings[index],
              ),
            ),
          ],
        ));
  }
}
