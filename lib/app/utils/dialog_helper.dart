// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:public_apis_desktop_client/app/data/models/dialog_data.dart';

import '../modules/views/general/update_general_alert_dialog/alert_dialog_widget.dart';
import '../services/fetch_api/failure.dart';

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

  static void showErrorDialog(
    Object error,
    BuildContext context, {
    required void Function() retryMethod,
  }) {
    const onWrongString = "something went wrong";
    final content = error is Failure ? error.content : onWrongString;
    final title = error is Failure ? error.title : onWrongString;

    final dialogData = DialogData(
      title: title,
      content: content,
      retryButtonMethod: () async {
        retryMethod();
      },
    );

    DialogHelper.showInfoDialog(
      dialogData,
      context,
    );
  }
}
