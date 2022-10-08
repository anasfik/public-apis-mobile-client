import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/scroll_to_top_bottom.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/home_controller.dart';

import '../../../../data/models/fab_model.dart';

extension InitFabOptionsDataExtension on HomeController {
void initFabOptionsData() {
  fabOptionsData = {
      "up": FabData(
        callback: () {
          scrollToTop();
        },
        icon: Icons.keyboard_arrow_up,
      ),
      "down": FabData(
        callback: () {
          scrollToBottom();
        },
        icon: Icons.keyboard_arrow_down,
      ),
    };
}

}