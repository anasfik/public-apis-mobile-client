import 'package:flutter/material.dart';

import '../apis_view_controller.dart';

extension UpdateOrderByLettersExtension on ApisViewController {
  static bool _shouldRebuildWidgets = false;
  static bool _previousIsAscending = false;

  /// Update the order by letters status
  void updateOrderByLettersStatus(bool isAscendingStatus) {
    // _changeShouldApisListReverseTo(isAscendingStatus);
    _toggleMapValues(isAscendingStatus);
  }

  /// return the color based on the isAscending status
  Color? colorBasedOnIsAscendingStatue(
    BuildContext context,
    bool boolValue,
  ) {
    return boolValue ? Theme.of(context).primaryColor : null;
  }

  _changeShouldApisListReverseTo(bool isAscendingStatus) {
    shouldApisListReverse = isAscendingStatus;
  }

  void _toggleMapValues(bool isAscendingStatus) {
    orderByLettersBoolValuesHashMap.forEach((key, value) {
      orderByLettersBoolValuesHashMap[key] =
          !orderByLettersBoolValuesHashMap[key];
    });

    _customUpdateOrderByLetters(isAscendingStatus);
  }

  void _customUpdateOrderByLetters(bool isAscendingStatus) {
    update();
    //   _shouldRebuildWidgets = (isAscendingStatus == _previousIsAscending);
    //   if (_shouldRebuildWidgets) {
    //     update();
    //     _previousIsAscending = isAscendingStatus;
    //   }
  }
}
