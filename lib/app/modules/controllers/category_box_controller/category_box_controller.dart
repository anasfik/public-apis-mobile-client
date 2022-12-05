import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/bottom_sheet_pptions_extension.dart';
import '../../../data/models/category_box_data_model.dart';

class CategoryBoxController extends GetxController {
  double scale = 1;
  static CategoryBoxData? currentCategoryData;
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

  void onLongPress(CategoryBoxData data, BuildContext context) {
    showBottomSheetOptions(context);
    currentCategoryData = data;
    }
}
