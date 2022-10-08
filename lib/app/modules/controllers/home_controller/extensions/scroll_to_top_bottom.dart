import 'package:flutter/material.dart';

import '../home_controller.dart';

extension ScrollToPositionsExtensions on HomeController {
  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOutQuart,
    );
  }

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOutQuart,
    );
  }
}
