import 'package:flutter/material.dart';

import '../../../views/categories_view/widgets/category_box/hidden_category_box_options.dart';
import '../../../views/categories_view/widgets/category_box/normal_category_box_options.dart';
import '../category_box_controller.dart';

extension BottomSheetOptionsExtension on CategoryBoxController {
  void showBottomSheetOptions(
    BuildContext context,
    BottomSheetMode mode,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        switch (mode) {
          case BottomSheetMode.normalBottomSheet:
            return const NormalCategoryBoxOptions();
          case BottomSheetMode.hiddenCategoryBottomSheet:
            return const HiddenCategoryBoxOptions();
          default:
            return const NormalCategoryBoxOptions();
        }
      },
    );
  }
}
