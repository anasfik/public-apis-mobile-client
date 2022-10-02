import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/generate_id_based_on_index.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/re_assign_filter_chip_selected.dart';
import 'package:public_apis_desktop_client/app/modules/views/apis_view/widgets/custom_choice_chip.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../../data/models/filter_choice_option.dart';

class FilterChoiceChips extends GetView<ApisViewController> {
  const FilterChoiceChips({
    super.key,
    required this.prefixFilterId,
  });

  final String prefixFilterId;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 7.5,
      direction: Axis.horizontal,
      children: <Widget>[
        ...List.generate(
          controller.filterOptions.length,
          (index) {
            return FilterChoiceChip(
              index: index,
              prefixFilterId: prefixFilterId,
              controller: controller,
            );
          },
        ),
      ],
    );
  }
}
