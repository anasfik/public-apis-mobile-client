import 'package:get/get.dart';

import '../../../services/analytics/mixin.dart';
import '../../../services/crashlytics/mixin.dart';
import 'mixins/analytics.dart';

class ApisViewController extends GetxController
    with FilterOptionsListsInitMixin, AnalyticsMixin, CrashlyticsMixin {
  String apisViewId = "ApisView";
  bool shouldApisListReverse = false;
}
