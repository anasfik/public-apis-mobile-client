import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/retry_fetch.dart';

import '../../../../utils/dialog_helper.dart';
import '../home_controller.dart';

extension ShowErrorExtension on HomeController {
  void showErrorDialog(Object error, BuildContext context) {
    DialogHelper.showErrorDialog(
      error,
      context,
      retryMethod: retryGetData,
    );
  }
}
