import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/generate_id_based_on_index.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/re_assign_filter_chip_selected.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../../data/models/filter_choice_option.dart';
import '../../../controllers/apis_view_controller/apis_view_controller.dart';

class FilterChoiceChip extends StatelessWidget {
  const FilterChoiceChip({
    Key? key,
    required this.index,
    required this.prefixFilterId,
    required this.controller,
  }) : super(key: key);

  final int index;
  final String prefixFilterId;
  final ApisViewController controller;

  @override
  Widget build(BuildContext context) {
    String currentChoiceId = controller.idBasedOnIndex(index, prefixFilterId);
    return GetBuilder<ApisViewController>(
      id: currentChoiceId,
      key: ValueKey(currentChoiceId),
      builder: (controller) {
        return Theme(
          data: ThemeData(
            splashColor: Theme.of(context).primaryColor.withOpacity(.15),
          ),
          child: FilterChip(
            checkmarkColor: Theme.of(context).primaryColor,
            selectedColor: Theme.of(context).primaryColor.withOpacity(.25),
            // surfaceTintColor: Colors.green,
            visualDensity: VisualDensity.compact,
            labelPadding: const EdgeInsets.symmetric(
              horizontal: 7.5,
              vertical: .5,
            ),
            label: Text(
              controller.filterOptions[index].optionText
                  .firstLettersToCapital(),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: controller.filterOptions[index].isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                  ),
            ),
            selected: controller.filterOptions[index].isSelected,
            onSelected: (bool newIsSelected) {
              FilterChoiceOption currentChoiceChip =
                  controller.filterOptions[index];
              controller.reAssignIsSelectedValueOf(
                currentChoiceChip,
                withIndexOf: index,
                withIdOf: currentChoiceId,
                isSelected: newIsSelected,
              );
            },
          ),
        );
      },
    );
  }
}
