import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/generate_id_based_on_index.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/re_assign_filter_chip_selected.dart';

class FilterChoiceChips extends GetView<ApisViewController> {
  const FilterChoiceChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ...List.generate(
          controller.filterOptions.length,
          (index) => GetBuilder<ApisViewController>(
              id: controller.idBasedOnIndex(index),
              builder: (context) {
                return ChoiceChip(
                  label: Text(controller.filterOptions[index].optionText),
                  selected: controller.filterOptions[index].isSelected,
                  onSelected: (bool newIsSelected) {
                    dynamic currentChoiceChip = controller.filterOptions[index];
                    controller.reAssignIsSelectedValueOf(
                      currentChoiceChip,
                      newIsSelected,
                      index,
                    );

                    
                  },
                );
              }),
        ),
      ],
    );
  }
}
