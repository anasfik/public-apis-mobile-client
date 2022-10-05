import 'package:flutter/material.dart';

import '../home_controller.dart';

extension ScrollControllerInitExtension on HomeController {
void scrollControllerInit(BuildContext context) {
      // init scrollController
    scrollController = ScrollController();

    // add listener to scrollController
    scrollController.addListener(() {
      if (scrollController.position.hasPixels &&
          scrollController.position.pixels != double.infinity &&
          scrollController.position.pixels > 0 &&
          scrollController.position.pixels < 140) {
        badgeBackgroundColor.value = badgeBackgroundColorTween.value.lerp(
              scrollController.position.pixels /
                  (expandedHeight - kToolbarHeight),
            ) ??
            Theme.of(context).primaryColor;
      }
    });
}
}