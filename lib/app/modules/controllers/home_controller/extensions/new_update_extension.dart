import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/modules/views/general/update_general_alert_dialog/new_update_alert_dialog.dart';

import '../../../../data/models/update_feature.dart';
import '../home_controller.dart';

extension NewUpdateExtension on HomeController {
  String get appVersion => "1.3.1";
  static bool isFirstTimeOpenedTheAppAfterUpdate =
      Hive.box("locals").get("isFirstTimeOpenedTheAppAfterUpdate2") ?? true;
  static final List<UpdateFeature> _featuresList = [
    UpdateFeature(
      type: UpdateType.fix,
      feature: "Fixed The non changing categories Grid in the settings",
    ),
    UpdateFeature(
      type: UpdateType.edit,
      feature: "Added new Theme",
    ),
  ];
  List<UpdateFeature> get featuresList => _featuresList;

  void showNewAppUpdateDialog(BuildContext context) {
    print(isFirstTimeOpenedTheAppAfterUpdate);

    showDialog(
      context: context,
      builder: (context) {
        return const NewUpdateAlertWidget();
      },
    );

    Box locals = Hive.box("locals");
    SchedulerBinding.instance.addPostFrameCallback((_) {
      locals.put("isFirstTimeOpenedTheAppAfterUpdate2", false);
    });
  }
}
