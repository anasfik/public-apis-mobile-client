import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/services/in_app_review/in_app_review.dart';

class HiveService {
  Box locals = Hive.box("locals");
  final String _timesUserOpenApisKey = "numberOfTimesUserOpenedAnApiLink";
  final String _dateOfFirstAppOpenKey = "dateOfFirstAppOpen";
  final String _dateAfter15DayFromDateOfFirstAppOpenKey =
      "dateAfter15DayFromDateOfFirstAppOpen";
  final String _targetNextReviewRequestKey = "targetNextReviewRequest";

  InAppReviewService _inAppReviewService = InAppReviewService();

  void saveDateOfFirstAppOpen() {
    bool isFirstTimeOpenedTheApp = locals.get(_dateOfFirstAppOpenKey) == null;
    if (isFirstTimeOpenedTheApp) {
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
    final bool isNeverClickedOnAnyApiLinks =
        locals.get(_timesUserOpenApisKey) == null;

    if (isNeverClickedOnAnyApiLinks) {
      locals.put(_timesUserOpenApisKey, 0);
    }

    final bool hasUserOpenedMoreThanTwoApis =
        locals.get(_timesUserOpenApisKey) > 2;
    if (hasUserOpenedMoreThanTwoApis &&
        havePassedMoreThan15DaysFromFirstAppOpen() &&
        locals.get(_targetNextReviewRequestKey) == null) {
      print(1);
      _inAppReviewService.fakeRequest();
      scheduleNextReviewAfter30Days();
    }
  }

  void handleShowingReviewAppRequestAfterFirstTime() {
    if (locals.get(_targetNextReviewRequestKey) != null) {
      if (havePassed30DaysFromFirstRequestShowAndNowDate()) {
        print(2);
        _inAppReviewService.fakeRequest();
        scheduleNextReviewAfter30Days();
      }
    }
  }

  bool havePassed30DaysFromFirstRequestShowAndNowDate() {
    return DateTime.now().isAfter(locals.get(_targetNextReviewRequestKey));
  }

  bool havePassedMoreThan15DaysFromFirstAppOpen() {
    DateTime dateWhichWeAreAllowedToShowReviewRequest =
        locals.get(_dateAfter15DayFromDateOfFirstAppOpenKey);

    return DateTime.now().isAfter(dateWhichWeAreAllowedToShowReviewRequest);
  }

  void incrementNumberOfApisOpenedByUser() {
    int numberOfTimesUserOpenedAnApiLink = locals.get(_timesUserOpenApisKey);

    locals.put(_timesUserOpenApisKey, ++numberOfTimesUserOpenedAnApiLink);
  }

  void scheduleNextReviewAfter30Days() {
    DateTime triggeredDateAfterFirstAppReviewRequest = DateTime.now();
    DateTime targetNextReviewRequest =
        triggeredDateAfterFirstAppReviewRequest.add(
      const Duration(minutes: 1),
    );

    locals.put(_targetNextReviewRequestKey, targetNextReviewRequest);
  }
}
