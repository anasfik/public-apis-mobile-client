import 'package:get/get.dart';

import '../../../services/analytics/mixin.dart';
import '../../../services/crashlytics/mixin.dart';
import 'mixins/analytics.dart';

class ApisViewController extends GetxController
    with FilterOptionsListsInitMixin, AnalyticsMixin, CrashlyticsMixin {
      
  final Map  orderByLettersBoolValuesHashMap = {
    "A-Z": true,
    "Z-A": false,
  };
  String apisViewId = "ApisView";
  bool shouldApisListReverse = false;
}
