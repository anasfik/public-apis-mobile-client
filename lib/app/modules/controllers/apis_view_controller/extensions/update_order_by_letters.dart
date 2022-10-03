import 'dart:collection';

import 'package:flutter/material.dart';

import '../apis_view_controller.dart';

extension UpdateOrderByLettersExtension on ApisViewController {
  static Map a = {
    "1": true,
    "2": false,
  };

  /// Update the order by letters status
  void updateOrderByLettersStatus(bool isAscendingStatus) {
    _changeShouldApisListReverseTo(isAscendingStatus);
    _customUpdateOrderByLetters();
    _toggleMapValue();
  }

  /// return the color based on the isAscending status
  Color colorBasedOnIsAscendingStatue(
    BuildContext context,
    bool isAscendingStatus,
  ) {
    return shouldApisListReverse == isAscendingStatus
        ? Theme.of(context).primaryColor
        : Colors.black;
  }

  _changeShouldApisListReverseTo(bool value) {
    shouldApisListReverse = value;
  }

  void _toggleMapValue() {
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
}
