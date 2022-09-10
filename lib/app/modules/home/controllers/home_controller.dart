import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../data/models/AllApis.dart';
import '../../../services/remote_service.dart';

class HomeController extends GetxController {
  static BuildContext? _context = Get.context;
  BuildContext? context;
  HomeController({this.context}) {
    _context = context;
  }
  // localsBox
  Box localsBox = Hive.box("locals");

  // badge background color tween
  final badgeBackgroundColorTween = ColorTween(
    begin: Theme.of(_context!).primaryColor,
    end: Theme.of(_context!).scaffoldBackgroundColor,
  );

  // expanded height for sliver app bar
  int expandedHeight = 140;
  // color observable
  Rx<Color?> badgeBackgroundColor = Theme.of(_context!).primaryColor.obs;
  @override
  void onInit() {
    // Declare textEditingController
    searchInputController = TextEditingController();

    // initialize the crossAxiCount
    crossAxisCount = localsBox.get("crossAxisCount") ?? 2;

    // Get data and store it in the getAllApisData variable
    getAllApisData = RemoteService.getData();

    // init scrollController
    scrollController = ScrollController();

    // add listener to scrollController
    scrollController.addListener(() {
      if (scrollController.position.hasPixels &&
          scrollController.position.pixels != double.infinity &&
          scrollController.position.pixels > 0) {
        badgeBackgroundColor.value = badgeBackgroundColorTween.lerp(
              scrollController.position.pixels /
                  (expandedHeight - kToolbarHeight),
            ) ??
            Theme.of(_context!).primaryColor;
      }
    });

    super.onInit();
  }

  // Future variables to get data once and use it in the app
  late Future<List<CategoryApis>> getAllApisData;

  // Search text editing controller
  late final TextEditingController searchInputController;

  // the crossAxisCount of the grid
  late int crossAxisCount;

  // the scroll controller
  late ScrollController scrollController;
}
