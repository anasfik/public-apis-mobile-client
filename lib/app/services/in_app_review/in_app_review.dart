import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_app_review/in_app_review.dart';

class InAppReviewService {
  final InAppReview inAppReview = InAppReview.instance;

  Box locals = Hive.box("locals");
  Future<void> request() async {
    bool isAvailable = await isServiceAvailable();

    if (isAvailable) {
      inAppReview.requestReview();
    }
  }

  void fakeRequest() {
    print("request app review");
  }

  Future<bool> isServiceAvailable() async {
    return await inAppReview.isAvailable();
  }
}
