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

        if (scrollController.position.maxScrollExtent ==
                scrollController.offset ||
            scrollController.offset == 0) {
          _hideFab();
        } else {
          _showFab();
        }
      },
    );
  }

  void _hideFab() {
    shouldFabShows = false;
    update([fabId]);
  }

  void _showFab() {
    shouldFabShows = true;
    update([fabId]);
  }

  bool _shouldChangeBadgeBgColor(ScrollController scrollController) {
    return scrollController.position.userScrollDirection ==
        ScrollDirection.forward;
  }

  void _handleBadgeBgColor(
      ScrollController scrollController, BuildContext context) {
    badgeBackgroundColorTween.value = ColorTween(
      begin: badgeBackgroundColor.value,
      end: Theme.of(context).scaffoldBackgroundColor,
    );
    badgeBackgroundColor.value = badgeBackgroundColorTween.value.lerp(0.5);
  }

  bool _isScrollingDown(ScrollController scrollController) {
    return scrollController.position.userScrollDirection ==
        ScrollDirection.forward;
  }

  bool _isScrollingUp(ScrollController scrollController) {
    return scrollController.position.userScrollDirection ==
        ScrollDirection.reverse;
  }



}
