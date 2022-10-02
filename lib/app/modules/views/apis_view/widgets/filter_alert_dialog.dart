import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import 'choice_chips.dart';

class FilterAlertDialog extends GetView<ApisViewController> {
  const FilterAlertDialog({
    super.key,
    required this.category,
  });

  final String category;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AutoSizeText("filter :".firstLettersToCapital()),
      content: const FilterChoiceChips(),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("cancel".firstLettersToCapital()),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            controller.update([category]);
          },
          child: Text("ok".firstLettersToCapital()),
        ),
      ],
    );
  }
}
