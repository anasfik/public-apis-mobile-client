import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloseButtonController extends GetxController {
  final id = "closeButtonId";

  Color closeButtonColor = Colors.grey[100]!;

  Color interactionCloseButtonColor = Colors.grey[300]!;

  void onPanDown() {
    _changeCloseButtonBgColor(interactionCloseButtonColor);
    update([id]);
  }

  void onPanCancel() {
    _resetColor();
    update([id]);
  }

  void onPanEnd() {
    onPanCancel();
  }

  void onPanStart() {
    onPanDown();
  }

  void _resetColor() {
    closeButtonColor = Colors.grey[100]!;
  }

  void _changeCloseButtonBgColor(Color newBgColor) {
    closeButtonColor = newBgColor;
  }
}
