import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/services/in_app_review/in_app_review.dart';

class HiveService {
  final InAppReviewService _inAppReviewService = InAppReviewService();
  Box locals = Hive.box("locals");
  final String _timesUserOpenApisKey = "numberOfTimesUserOpenedAnApiLink";
  final String _dateOfFirstAppOpenKey = "dateOfFirstAppOpen";
  final String _dateAfter15DayFromDateOfFirstAppOpenKey =
      "dateAfter15DayFromDateOfFirstAppOpen";
  final String _targetNextReviewRequestKey = "targetNextReviewRequest";

  void saveDateOfFirstAppOpen() {
    if (_isFirstTimeOpenedTheApp()) {
      locals.put(_dateOfFirstAppOpenKey, DateTime.now());
      locals.put(
        _dateAfter15DayFromDateOfFirstAppOpenKey,
        DateTime.now().add(
          const Duration(minutes: 1),
        ),
      );
    }
  }

  void handleFirstShowingOfAppRequestReview() {
    _initializeApisOpensCounterIfFirstTime();

    if (_hasUserOpenedMoreThanTwoApis() &&
        _havePassedMoreThan15DaysFromFirstAppOpen() &&
        !_didScheduledNext30DaysAfterFirstReviewRequest()) {
      print(1);
      _inAppReviewService.fakeRequest(1);
      _scheduleNextReviewAfter30Days();
    }
  }

  void handleShowingReviewAppRequestAfterFirstTime() {
    if (_didScheduledNext30DaysAfterFirstReviewRequest()) {
      if (_havePassed30DaysFromFirstRequestReviewRequestAndToday()) {
        _inAppReviewService.fakeRequest(2);
        _scheduleNextReviewAfter30Days();
      }
    }
  }

  bool _isFirstTimeOpenedTheApp() {
    return locals.get(_dateOfFirstAppOpenKey) == null;
  }

  void _initializeApisOpensCounterIfFirstTime() {
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

  void incrementNumberOfApisOpenedByUser() {
    int numberOfTimesUserOpenedAnApiLink = locals.get(_timesUserOpenApisKey);

    locals.put(_timesUserOpenApisKey, ++numberOfTimesUserOpenedAnApiLink);
  }

  void _scheduleNextReviewAfter30Days() {
    DateTime triggeredDateAfterFirstAppReviewRequest = DateTime.now();
    DateTime targetNextReviewRequest =
        triggeredDateAfterFirstAppReviewRequest.add(
      const Duration(minutes: 1),
    );

    locals.put(_targetNextReviewRequestKey, targetNextReviewRequest);
  }
}
