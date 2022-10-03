import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/utils/extensions/getx_controller_extension.dart';

import '../apis_view_controller.dart';

extension UpdateOrderByLettersExtension on ApisViewController {
  static late bool shouldRebuildWidgets;
  static HashMap orderByLettersBoolValuesHashMap = HashMap(
    hashCode: (p0) => p0.hashCode,
    equals: (p0, p1) => p0 == p1,
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
    orderByLettersBoolValuesHashMap.map(
      (key, value) => MapEntry(key, !value),
    );
  }

  void _customUpdateOrderByLetters(bool isAscendingStatus) {
    if (shouldRebuildWidgets == isAscendingStatus) {
      return;
    }
    devLog("widgets rebuilt");

    update(
      List.from(
        orderByLettersBoolValuesHashMap.values.map(
          (e) => e.toString(),
        ),
      ),
    );
  }
}
