import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/fab_handler.dart';

import '../../../../data/models/fab_model.dart';
import '../home_controller.dart';

extension ScrollControllerInitExtension on HomeController {
  void initScrollController(BuildContext context) {
    scrollController = ScrollController();

    scrollController.addListener(
      () {
        if (_shouldChangeBadgeBgColor(scrollController)) {
          _handleBadgeBgColor(scrollController, context);
        }

        if (_isScrollingDown(scrollController)) {
          switchAndUpdateFabDataTo(FabDirectionOption.up);
        } else if (_isScrollingUp(scrollController)) {
          switchAndUpdateFabDataTo(FabDirectionOption.down);
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
    return scrollController.position.hasPixels &&
        scrollController.position.pixels != double.infinity &&
        scrollController.position.pixels > 0 &&
        scrollController.position.pixels < 140;
  }

  void _handleBadgeBgColor(
      ScrollController scrollController, BuildContext context) {
 
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
}
