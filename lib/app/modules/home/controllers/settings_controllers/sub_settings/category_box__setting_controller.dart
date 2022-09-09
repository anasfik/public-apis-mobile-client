import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ToggleCategoriesController extends GetxController {
  @override
  void onInit() {
    categoriesViewBool = [true, false];
    super.onInit();
  }

  late List<bool> categoriesViewBool;

  void toggleView({required int index}) {
    categoriesViewBool.fillRange(0, categoriesViewBool.length, false);
    categoriesViewBool[index] = true;
    update();
  }
}
