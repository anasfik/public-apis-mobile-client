import 'package:flutter/material.dart';

import '../../../views/categories_view/widgets/category_box/category_box_options.dart';
import '../category_box_controller.dart';

extension BottomSheetOptionsExtension on CategoryBoxController {
  void showBottomSheetOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      
      builder: (context) {
        return const CategoryBoxOptions();
      },
    );
  }
}
