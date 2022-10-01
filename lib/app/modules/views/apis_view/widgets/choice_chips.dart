import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';

class FilterChoiveChips extends GetView<ApisViewController> {
  const FilterChoiveChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ...List.generate(
            controller.filterOptions.length,
            (index) => ChoiceChip(
                  label: Text(controller.filterOptions[index].optionText),
                  selected: controller.filterOptions[index].isSelected,
                  onSelected: (bool selected) {
                    print(selected);
                  },
                ))
      ],
    );
  }
}
