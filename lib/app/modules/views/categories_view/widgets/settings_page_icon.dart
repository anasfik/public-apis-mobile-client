import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPageIcon extends StatelessWidget {
  const SettingsPageIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed("/settings");
      },
      icon: const Icon(
        Icons.settings,
      ),
    );
  }
}
