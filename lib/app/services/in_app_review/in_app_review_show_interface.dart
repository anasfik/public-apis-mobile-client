import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/services/in_app_review/in_app_review_service.dart';

class InAppReviewShowLogicInterface {
  /// box where we gonna store data
  Box locals = Hive.box("locals");

  /// service instance
  final InAppReviewService _inAppReviewService = InAppReviewService();

  /// key for the counter of number of times an API link was opened by user
  final String _timesUserOpenApisKey = "numberOfTimesUserOpenedAnApiLink";

  /// key for first [DateTime] when the user opens app for first time
  final String _dateOfFirstAppOpenKey = "dateOfFirstAppOpen";

  /// date of first schedule date of review request
  final String _dateAfter15DayFromDateOfFirstAppOpenKey =
      "dateAfter15DayFromDateOfFirstAppOpen";

  /// key for the second, third... time the date after the first request date showed to the user
  final String _targetNextReviewRequestKey = "targetNextReviewRequest";

  // this will save the date when the user opened the app for first time, then save the target date after 15 days of it.
  void saveDateOfFirstAppOpen() {
    locals.put(_dateOfFirstAppOpenKey, DateTime.now());
    locals.put(
      _dateAfter15DayFromDateOfFirstAppOpenKey,
      DateTime.now().add(
        const Duration(days: 15),
      ),
    );
  }

// this will execute only if all conditions are true, it will show first time review request
// then, schedule another next review request after 30 days
  void handleFirstShowingOfAppRequestReview() {
    if (_hasUserOpenedMoreThanTwoApis() &&
        _havePassedMoreThan15DaysFromFirstAppOpen() &&
        !_didScheduledNext30DaysAfterFirstReviewRequest()) {
      _inAppReviewService.request();
      _scheduleNextReviewAfter30Days();
    }
  }

  void handleShowingReviewAppRequestAfterFirstTime() {
    if (_didScheduledNext30DaysAfterFirstReviewRequest()) {
      if (_havePassed30DaysFromFirstRequestReviewRequestAndToday()) {
        _inAppReviewService.request();
        _scheduleNextReviewAfter30Days();
      }
    }
  }

  void incrementNumberOfApisOpenedByUser() {
    int numberOfTimesUserOpenedAnApiLink = locals.get(_timesUserOpenApisKey);

    locals.put(_timesUserOpenApisKey, ++numberOfTimesUserOpenedAnApiLink);
  }

  bool isFirstTimeOpenedTheApp() {
    return locals.get(_dateOfFirstAppOpenKey) == null;
  }

  void initializeApisOpensCounterIfFirstTime() {
    final bool isNeverClickedOnAnyApiLinks =
        locals.get(_timesUserOpenApisKey) == null;

    if (isNeverClickedOnAnyApiLinks) {
      locals.put(_timesUserOpenApisKey, 0);
    }
  }

  bool _hasUserOpenedMoreThanTwoApis() {
    return locals.get(_timesUserOpenApisKey) > 2;
  }

  bool _didScheduledNext30DaysAfterFirstReviewRequest() {
    return locals.get(_targetNextReviewRequestKey) != null;
  }

  bool _havePassed30DaysFromFirstRequestReviewRequestAndToday() {
    return DateTime.now().isAfter(locals.get(_targetNextReviewRequestKey));
  }

  bool _havePassedMoreThan15DaysFromFirstAppOpen() {
    DateTime dateWhichWeAreAllowedToShowReviewRequest =
        locals.get(_dateAfter15DayFromDateOfFirstAppOpenKey);

    return DateTime.now().isAfter(dateWhichWeAreAllowedToShowReviewRequest);
  }

  void _scheduleNextReviewAfter30Days() {
    DateTime triggeredDateAfterFirstAppReviewRequest = DateTime.now();
    DateTime targetNextReviewRequest =
        triggeredDateAfterFirstAppReviewRequest.add(
      const Duration(days: 30),
    );

    locals.put(_targetNextReviewRequestKey, targetNextReviewRequest);
  }
}
