import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/home_controller.dart';

extension ReminderHeightCalculator on HomeController {
  double calculateReminderHeight(BuildContext context) {
    final mq = MediaQuery.of(context);
    final statusBatHeight = mq.padding.top;
    final screenSize = mq.size.height;

    return screenSize -
        statusBatHeight * 2 -
        expandedHeight -
        (sizedBoxHeight * 5) -
        searchBarHeight;
  }
}
