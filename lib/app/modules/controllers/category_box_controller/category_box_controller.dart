import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/bottom_sheet_pptions_extension.dart';

import '../../views/categories_view/widgets/category_box/category_box_options.dart';
import 'mixins/category_box_options_mixin.dart';

class CategoryBoxController extends GetxController
    with CategoryBoxOptionsMixin {
  double scale = 1;
  void onPanCancel(String id) {
    scale = 1;
    update([id]);
  }

  void onPanEnd(String id) {
    scale = 1;
    update([id]);
  }

  void onPanDown(String id) {
    scale = 0.98;
    update([id]);
  }

  void onLongPress(BuildContext context) {
showBottomSheetOptions(context);
  }

}
