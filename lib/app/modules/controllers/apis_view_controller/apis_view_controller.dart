import 'dart:collection';

import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/initialize_variables.dart';

import '../../../services/analytics/mixin.dart';
import '../../../services/crashlytics/mixin.dart';
import '../../../services/in_app_review/in_app_review.dart';
import '../../../services/in_app_review/in_app_review_show_interface.dart';
import 'mixins/filter_options_Lists.dart';

class ApisViewController extends GetxController
    with FilterOptionsListsInitMixin, AnalyticsMixin, CrashlyticsMixin {
  /// Responsible to reverse apis view list.

  late bool shouldApisListReverse;

  /// Bool that will store last state bool value of the toggle button.
  late bool previousIsAscending;

  /// HashMap where we store bool values.
  late final HashMap orderByLettersBoolValuesHashMap;

  /// Hive service.
  InAppReview hiveService = InAppReview();

  /// Id which is used to update the toggle button.
  final String _orderLettersId = "OrderByLettersToggleId";

  String get orderLettersToggleId => _orderLettersId;
  HashMap get orderByLettersBoolHashMap => orderByLettersBoolValuesHashMap;

  @override
  void onInit() {
    initializeVariables();
    super.onInit();
  }
}
