import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/services/crashlytics/crashlytics.dart';

import '../../../data/models/filter_choice_option.dart';
import '../../../services/analytics/firebas_analytics.dart';
import '../../../services/analytics/mixin.dart';
import '../../../services/crashlytics/mixin.dart';
import 'mixins/analytics.dart';

class ApisViewController extends GetxController
    with FilterOptionsListsInitMixin, AnalyticsMixin, CrashlyticsMixin {
  String apisViewId = "ApisView";
}

