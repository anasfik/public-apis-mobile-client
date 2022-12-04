import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoryBoxController extends GetxController {
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
    scale = 0.95;
    update([id]);
  }
}
