import 'in_app_review_show_interface.dart';

class InAppReview extends InAppReviewShowLogicInterface {
  void handleShowingTheReviewRequest() {
    if (isFirstTimeOpenedTheApp()) {
      saveDateOfFirstAppOpen();
      initializeApisOpensCounterIfFirstTime();
    }

    handleFirstShowingOfAppRequestReview();
    handleShowingReviewAppRequestAfterFirstTime();
  }
}
