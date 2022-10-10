import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/modules/views/general/update_general_alert_dialog/new_update_alert_dialog.dart';

import '../../../../data/models/update_feature.dart';
import '../home_controller.dart';

extension NewUpdateExtension on HomeController {
  static bool isFirstTimeOpenedTheAppAfterUpdate = Hive.box("locals").get("isFirstTimeOpenedTheAppAfterUpdate") ?? true;
  static final List<UpdateFeature> _featuresList = [
    UpdateFeature(
      type: UpdateType.add,
      feature: "added (A-Z) / (Z-A) sort for APIs list.",
    ),
    UpdateFeature(
      type: UpdateType.add,
      feature: "added APIs filter with tags (Github, https...).",
    ),
    UpdateFeature(
      type: UpdateType.add,
      feature: "added scroll to top / bottom floating action button.",
    ),
    UpdateFeature(
      type: UpdateType.improvement,
      feature: "Improved the performance of the app.",
    ),
  ];
  List<UpdateFeature> get featuresList => _featuresList;

  void showNewAppUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const NewUpdateAlertWidget();
      },
    );

    Box locals = Hive.box("locals");
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!kDebugMode) {
        locals.put("isFirstTimeOpenedTheAppAfterUpdate", false);

      }
    });
  }
}
