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
        if (_isOpacityValueAtPossibleRange(scrollController)) {
          _handleOPacityValue(scrollController);
        }

        if (_isScrollingDown(scrollController)) {
          switchAndUpdateFabDataTo(FabDirectionOption.up);
        } else if (_isScrollingUp(scrollController)) {
          switchAndUpdateFabDataTo(FabDirectionOption.down);
        }

        final isAtScreenLimits = _hasReachedEndOfScreen(scrollController) ||
            _hasReachedStartOfScreen(scrollController);
        if (isAtScreenLimits) {
          _hideFab();
        } else {
          _showFab();
        }
      },
    );
  }

  bool _hasReachedEndOfScreen(ScrollController scrollController) {
    return scrollController.position.maxScrollExtent == scrollController.offset;
  }

  bool _hasReachedStartOfScreen(ScrollController scrollController) {
    return scrollController.offset == 0;
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
    final pixels = scrollController.position.pixels;

    return scrollController.position.hasPixels &&
        pixels != double.infinity &&
        pixels > 0 &&
        pixels < expandedHeight;
  }

  void _handleBadgeBgColor(
    ScrollController scrollController,
    BuildContext context,
  ) {
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

  void _handleOPacityValue(ScrollController scrollController) {
    final onCurrentScrollPositionValue =
        _calculatePossibleOpacityValue(scrollController);

    if (onCurrentScrollPositionValue < 0) {
      opacityValue.value = 0;
    } else if (onCurrentScrollPositionValue > 1) {
      opacityValue.value = 1;
    } else {
      opacityValue.value = onCurrentScrollPositionValue;
    }
  }

  bool _isOpacityValueAtPossibleRange(ScrollController scrollController) {
    final onCurrentScrollPositionValue =
        _calculatePossibleOpacityValue(scrollController);

    return onCurrentScrollPositionValue >= 0 &&
        onCurrentScrollPositionValue <= 1;
  }

  double _calculatePossibleOpacityValue(ScrollController scrollController) {
    return 1 - (scrollController.position.pixels / expandedHeight * 2);
  }
}
