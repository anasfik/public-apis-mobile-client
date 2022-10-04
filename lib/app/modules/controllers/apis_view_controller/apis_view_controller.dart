import 'dart:collection';

import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/initialize_variables.dart';

import '../../../services/analytics/mixin.dart';
import '../../../services/crashlytics/mixin.dart';
import 'mixins/analytics.dart';

class ApisViewController extends GetxController
    with FilterOptionsListsInitMixin, AnalyticsMixin, CrashlyticsMixin {
  @override
  void onInit() {
    initializeVariables();
    super.onInit();
  }

  /// responsible to reverse apis view list
  late bool shouldApisListReverse;

  /// bool that will store last state bool value of the toggle button
  late bool previousIsAscending;

  /// hashMap where we store bool values
  late final HashMap orderByLettersBoolValuesHashMap;
  HashMap get orderByLettersBoolHashMap => orderByLettersBoolValuesHashMap;

  /// id which is used to update the toggle button
  final String _orderLettersId = "OrderByLettersToggleId";
  String get orderLettersToggleId => _orderLettersId;

  // /// id which responsible to update the the apisView
  // final String _apisViewId = "ApisView";
  // String get apisViewId => _apisViewId;
}
