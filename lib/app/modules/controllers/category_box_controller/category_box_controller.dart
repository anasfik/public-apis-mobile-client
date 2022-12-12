import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/bottom_sheet_pptions_extension.dart';
import '../../../data/models/category_box_data_model.dart';
import '../favorites_controller/favorites_controller.dart';

enum BottomSheetMode {
  normalBottomSheet,
  hiddenCategoryBottomSheet,
}

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

  void onPanDown(
    String id,
    data,
    BuildContext context, {
    required BottomSheetMode bottomSheetMode,
  }) {
    startLongPressTimer(data, bottomSheetMode, context);

    scale = 0.98;
    update([id]);
  }

  void startLongPressTimer(
    CategoryBoxData data,
    BottomSheetMode bottomSheetMode,
    BuildContext context,
  ) {
    longPressTimer = Timer(
      longPressDuration,
      () {
        showBottomSheetOptions(
          context,
          bottomSheetMode,
        );

        currentCategoryData = data;
        makeSureTheFavoritesControllerIsInjected();
      },
    );
  }

  void makeSureTheFavoritesControllerIsInjected() {
    if (GetInstance().isRegistered<FavoritesController>()) {
      return;
    }

    Get.put<FavoritesController>(FavoritesController());
  }
}
