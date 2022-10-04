import 'dart:collection';

import 'package:flutter/material.dart';

import '../apis_view_controller.dart';

extension UpdateOrderByLettersExtension on ApisViewController {
  
  /// Update the order by letters status
  void updateOrderByLettersStatus(bool isAscendingStatus) {
    if (_shouldExecuteAndReBuildWidgets(isAscendingStatus)) {
      _changeShouldApisListReverseTo(isAscendingStatus);
      _toggleMapValues(isAscendingStatus);
      update([orderLettersToggleId]);
      _saveCurrentValueToAvoidUnnecessaryWork(isAscendingStatus);
    }
  }

  /// the _previousIsAscending value will be used to check if the user has clicked something different than last time, to avoid unnecessary change and unnecessary work
  // ! Note: I wrapped all under a condition so even the rebuild of widget will not be done, so if there is a weird behavior, the user will not expect change in the reverse order.
  void _saveCurrentValueToAvoidUnnecessaryWork(bool boolValue) {
    previousIsAscending = !boolValue;
  }

  /// this what we used to check the unnecessary work
  bool _shouldExecuteAndReBuildWidgets(bool boolValue) {
    return boolValue == previousIsAscending;
  }

  /// return the primaryColor or a null value based on the isAscending status
  // ! Note: the null value will be used to change the color of the icon to the default color in the view
  Color? colorBasedOnIsAscendingStatue(
    BuildContext context,
    bool boolValue,
  ) {
    return boolValue ? Theme.of(context).primaryColor : null;
  }

  /// this is the responsible method to toggle the value of shouldApisListReverse in the controller to reverse List of apis
  _changeShouldApisListReverseTo(bool isAscendingStatus) {
    shouldApisListReverse = isAscendingStatus;
  }

  /// this is the responsible method to toggle the value of the map values in the controller to change the color of the icons
  void _toggleMapValues(bool isAscendingStatus) {
    orderByLettersBoolValuesHashMap.forEach(
      (key, value) {
        orderByLettersBoolValuesHashMap[key] =
            !orderByLettersBoolValuesHashMap[key];
      },
    );
  }
}
