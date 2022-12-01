// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:public_apis_desktop_client/app/data/models/dialog_data.dart';

import '../modules/views/general/update_general_alert_dialog/alert_dialog_widget.dart';

class DialogHelper {
  static void showInfoDialog(
    DialogData dialogData,
    BuildContext context,
  ) {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialogWidget(dialogData);
          },
        );
      },
    );
  }
}
