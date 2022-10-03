import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/utils/extensions/getx_controller_extension.dart';

import '../apis_view_controller.dart';

extension UpdateOrderByLettersExtension on ApisViewController {
  static bool _shouldRebuildWidgets = false;
  static bool _previousIsAscending = true;

  static final HashMap _orderByLettersBoolValuesHashMap = HashMap(
    hashCode: (key) => key.hashCode,
    equals: (a, b) => a == b,
  )
    ..putIfAbsent(
      "A-Z",
      () => true,
    )
    ..putIfAbsent(
      "Z-A",
      () => false,
    );

  /// Update the order by letters status
  void updateOrderByLettersStatus(bool isAscendingStatus) {
    _changeShouldApisListReverseTo(isAscendingStatus);
    _customUpdateOrderByLetters(isAscendingStatus);
    _toggleMapValues();
  }

  /// return the color based on the isAscending status
  Color? colorBasedOnIsAscendingStatue(
    BuildContext context,
    bool isAscendingStatus,
  ) {
    return shouldApisListReverse == isAscendingStatus
        ? Theme.of(context).primaryColor
        : null;
  }

  _changeShouldApisListReverseTo(bool value) {
    shouldApisListReverse = value;
  }

  void _toggleMapValues() {
    _orderByLettersBoolValuesHashMap.map(
      (key, value) => MapEntry(key, !value),
    );
  }

  void _customUpdateOrderByLetters(bool isAscendingStatus) {
    _shouldRebuildWidgets = isAscendingStatus != _previousIsAscending;
    if ((_shouldRebuildWidgets)) {
      devLog("widgets rebuilt");
      update(
        List.from(
          _orderByLettersBoolValuesHashMap.values.map(
            (boolValue) => boolValue.toString(),
          ),
        ),
      );
      _previousIsAscending = isAscendingStatus;
    }
  }
}
