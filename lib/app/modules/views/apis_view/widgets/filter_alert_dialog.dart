import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import 'choice_chips.dart';

class FilterAlertDialog extends StatelessWidget {
  const FilterAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AutoSizeText("filter".firstLettersToCapital()),
      content: const FilterChoiceChips(),
    );
  }
}
