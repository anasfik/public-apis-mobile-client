import 'dart:collection';

import 'package:flutter/material.dart';

import '../apis_view_controller.dart';

extension UpdateOrderByLettersExtension on ApisViewController {
  static Map a = {
    "1": true,
    "2": false,
  };
  void updateOrderByLettersStatus(bool isAscendingStatus) {
    shouldApisListReverse = isAscendingStatus;

    _customUpdateOrderByLetters();
    a.map(
      (key, value) => MapEntry(key, !value),
    );
  }

  void _customUpdateOrderByLetters() {
    update(
      List.from(
        a.values.map(
          (e) => e.toString(),
        ),
      ),
    );
  }

  Color colorBasedOnIsAscendingStatue(
      BuildContext context, bool isAscendingStatus) {
    return shouldApisListReverse == a
        ? Theme.of(context).primaryColor
        : Colors.black;
  }
}
