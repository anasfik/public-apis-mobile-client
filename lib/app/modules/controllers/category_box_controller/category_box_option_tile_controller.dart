import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryBoxOptionTileController extends GetxController {
  Color? optionTileBgColor;
  final _interactionTileBgColor = Colors.grey[300]!;

  void onPanDown(String id) {
    _changeCloseButtonBgColor(_interactionTileBgColor);
    update([id]);
  }

  void onPanCancel(String id) {
    _resetColor();
    update([id]);
  }

  void onPanEnd(String id) {
    onPanCancel(id);
  }

  void onPanStart(String id) {
    onPanDown(id);
  }

  void _resetColor() {
    optionTileBgColor = null;
  }

  void _changeCloseButtonBgColor(Color newBgColor) {
    optionTileBgColor = newBgColor;
  }
}
