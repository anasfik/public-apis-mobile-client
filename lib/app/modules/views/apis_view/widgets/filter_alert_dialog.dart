import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import 'choice_chips.dart';
import 'order_by_letters_toggle.dart';

class FilterAlertDialog extends GetView<ApisViewController> {
  const FilterAlertDialog({
    super.key,
    required this.category,
  });

  final String category;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "filter :".firstLettersToCapital(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "order :".firstLettersToCapital(),
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const OrderByLettersToggle(),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tags :".firstLettersToCapital(),
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            FilterChoiceChips(prefixFilterId: category),
          ],
        ),
      ),
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
