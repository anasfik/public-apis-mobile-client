import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryBoxOptionTileController extends GetxController {
  final id = "closeButtonId";

  Color? closeButtonColor;

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
    closeButtonColor = null;
  }

  void _changeCloseButtonBgColor(Color newBgColor) {
    closeButtonColor = newBgColor;
  }
}
