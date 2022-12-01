import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:public_apis_desktop_client/app/data/models/dialog_data.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

class AlertDialogWidget extends StatelessWidget {
  final DialogData dialogData;
  const AlertDialogWidget(
    this.dialogData, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Text(
        dialogData.title.capitalizeAllWordsFirstLetter(),
        style: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        dialogData.content.capitalizeAllWordsFirstLetter(),
        style: textTheme.bodyText1,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "cancel".capitalizeAllWordsFirstLetter(),
          ),
        ),
        TextButton(
          onPressed: dialogData.retryButtonMethod,
          child: Text(dialogData.retryButtonText),
        ),
      ],
    );
  }
}
