import 'package:hive_flutter/hive_flutter.dart';

import '../home_controller.dart';

extension InitCrossAxisCountExtension on HomeController {
  void initGridCrossAxisCount() {
    crossAxisCount = locals.getWithKey("crossAxisCount") ?? 2;
  }
}
