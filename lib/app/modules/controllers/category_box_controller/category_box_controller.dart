import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/bottom_sheet_pptions_extension.dart';
import '../../../data/models/category_box_data_model.dart';

class CategoryBoxController extends GetxController {
  Timer? longPressTimer;
  final longPressDuration = const Duration(milliseconds: 250);

  double scale = 1;
  static CategoryBoxData? currentCategoryData;
  void onPanCancel(String id) {
    cancelLongPressTimer();
    scale = 1;
    update([id]);
  }

  void cancelLongPressTimer() {
    longPressTimer?.cancel();
  }

  void onPanEnd(String id) {
    cancelLongPressTimer();
    scale = 1;
    update([id]);
  }

  void onPanDown(String id, data, context) {
    startLongPressTimer(data, context);

    scale = 0.98;
    update([id]);
  }

  void startLongPressTimer(CategoryBoxData data, BuildContext context) {
    longPressTimer = Timer(
      longPressDuration,
      () {
        showBottomSheetOptions(context);
        currentCategoryData = data;
      },
    );
  }
}
