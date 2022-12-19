import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/modules/views/general/update_general_alert_dialog/new_update_alert_dialog.dart';

import '../../../../data/models/update_feature.dart';
import '../home_controller.dart';

extension NewUpdateExtension on HomeController {
  String get appVersion => "2.0.0";

  static bool isFirstTimeOpenedTheAppAfterUpdate =
      Hive.box("locals").get("isFirstTimeOpenedTheAppAfterUpdate") ?? true;
  static final List<UpdateFeature> _featuresList = [
    UpdateFeature(
      type: UpdateType.fix,
      feature: "Fixed The non changing categories Grid in the settings",
    ),
    UpdateFeature(
      type: UpdateType.edit,
      feature: "Added new Theme",
    ),
    UpdateFeature(
      type: UpdateType.add,
      feature: "Added copy feature for categories",
    ),
    UpdateFeature(
      type: UpdateType.add,
      feature:
          "Added possibility to bookmark all category APIs at once, and to remove all bookmarks at once also",
    ),
    UpdateFeature(
      type: UpdateType.add,
      feature: "Added possibility to hide/show categories on your choice",
    ),
    UpdateFeature(
      type: UpdateType.add,
      feature: "Added share feature for categories",
    ),
    UpdateFeature(
      type: UpdateType.fix,
      feature: "Improved the performance of the app",
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
      locals.put("isFirstTimeOpenedTheAppAfterUpdate", false);
    });
  }
}
