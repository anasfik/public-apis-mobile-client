import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    searchInputController = TextEditingController(text: "");
    super.onInit();
  }

  // Search text editing controller
  late final TextEditingController searchInputController;

  double handleFontSizeValue(String text) {
    if (text.length > 20) {
      return 17;
    }
    return 20;
  }
}
