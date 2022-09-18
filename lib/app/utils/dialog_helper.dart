import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

class DialogHelper {
  static showInfoDialog({
    required BuildContext context,
    String title = "Error",
    required String content,
    required void Function() retryButtonMethod,
    String retryButtonText = "Retry",
  }) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              TextHelperMethods.firstLettersToCapital(title),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            content: Text(
              TextHelperMethods.firstLettersToCapital(content),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  TextHelperMethods.firstLettersToCapital("Cancel"),
                ),
              ),
              TextButton(
                onPressed: retryButtonMethod,
                child: Text(retryButtonText),
              ),
            ],
          );
        },
      );
    });
  }
}

class AlertTextButton extends StatelessWidget {
  const AlertTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.boldText = false,
  });

  final String text;
  final void Function() onPressed;
  final Color? textColor;
  final bool boldText;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: textColor ?? Theme.of(context).scaffoldBackgroundColor,
              fontWeight: boldText ? FontWeight.bold : null,
            ),
      ),
    );
  }
}
