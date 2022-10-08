import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/fab_handler.dart';

import '../home_controller.dart';

extension ScrollControllerInitExtension on HomeController {
  
  void scrollControllerInit(BuildContext context) {
    // init scrollController
    scrollController = ScrollController();

    // add listener to scrollController
    scrollController.addListener(
      () {
        if (_shouldChangeBadgeBgColor(scrollController)) {
          _handleBadgeBgColor(scrollController, context);
        }

        if (_isScrollingDown(scrollController)) {
          switchFabDataTo(FabDirectionOption.up);
        } else if (_isScrollingUp(scrollController)) {
          switchFabDataTo(FabDirectionOption.down);
        }
      },
    );
  }

  void _handleBadgeBgColor(ScrollController controller, BuildContext context) {
    badgeBackgroundColor.value = badgeBackgroundColorTween.value.lerp(
          scrollController.position.pixels / (expandedHeight - kToolbarHeight),
        ) ??
        Theme.of(context).primaryColor;
  }

  bool _isScrollingDown(ScrollController scrollController) {
    return scrollController.position.userScrollDirection ==
        ScrollDirection.forward;
  }

  bool _isScrollingUp(ScrollController scrollController) {
    return scrollController.position.userScrollDirection ==
        ScrollDirection.reverse;
  }

  bool _shouldChangeBadgeBgColor(ScrollController controller) {
    return scrollController.position.hasPixels &&
        scrollController.position.pixels != double.infinity &&
        scrollController.position.pixels > 0 &&
        scrollController.position.pixels < 140;
  }

  
}
