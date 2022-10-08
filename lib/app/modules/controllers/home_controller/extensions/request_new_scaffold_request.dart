// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';

import '../home_controller.dart';

final focusNode = FocusNode();

extension RequestNewScaffoldRequest on HomeController {
  /// this will remove the focus from the search bar and request a new scaffold focus request
  void requestNewFocusScope(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
    if (focusNode.hasListeners && focusNode.hasPrimaryFocus) {
      focusNode.dispose();
    }
  }
}
