import 'package:in_app_review/in_app_review.dart';

class InAppReviewService {
  final InAppReview inAppReview = InAppReview.instance;
  Future<void> request() async {
    bool isAvailable = await isServiceAvailable();

    if (isAvailable) {
      inAppReview.requestReview();
    }
  }

  Future<void> openStoreListing({
    String? appStoreId,
    String? microsoftStoreId,
  }) async {
    bool isAvailable = await isServiceAvailable();

    if (isAvailable) {
      inAppReview.openStoreListing(
        appStoreId: appStoreId,
        microsoftStoreId: microsoftStoreId,
      );
    }
  }

  Future<bool> isServiceAvailable() async {
    return await inAppReview.isAvailable();
  }



}

