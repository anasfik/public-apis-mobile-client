import 'dart:collection';

import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';

extension InitializeVariables on ApisViewController {
    void initializeVariables() {
    previousIsAscending = true;
    orderByLettersBoolValuesHashMap = HashMap<String, bool>(
      equals: (a, b) => a == b,
      hashCode: (a) => a.hashCode,
    )..addAll(
        {
          "A-Z": true,
          "Z-A": false,
        },
      );
    shouldApisListReverse = false;
  }
}