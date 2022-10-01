import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/services/crashlytics/crashlytics.dart';

import '../../../data/models/filter_choice_option.dart';
import '../../../services/analytics/firebas_analytics.dart';

class ApisViewController extends GetxController {
  Analytics analytics = Analytics();
  Crashlytics crashlytics = Crashlytics();
  List<FilterChoiceOption> filterOptions = [
    FilterChoiceOption(
      optionText: "Auth",
      isSelected: false,
    ),
    FilterChoiceOption(
      optionText: "HTTPS",
      isSelected: false,
    ),
    FilterChoiceOption(
      optionText: "Cors",
      isSelected: false,
    ),
    FilterChoiceOption(
      optionText: "apikey",
      isSelected: false,
    ),
  ];
  String apisViewId = "ApisView";
}
