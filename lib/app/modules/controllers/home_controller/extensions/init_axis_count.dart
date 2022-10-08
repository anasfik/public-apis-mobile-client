import 'package:hive_flutter/hive_flutter.dart';

import '../home_controller.dart';

extension InitCrossAxisCountExtension on HomeController {
  void initGridCrossAxisCount() {
    Box localsBox = Hive.box("locals");
    crossAxisCount = localsBox.get("crossAxisCount") ?? 2;
  }
}
