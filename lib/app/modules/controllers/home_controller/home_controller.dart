import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/scroll_controller_init.dart';

import '../../../data/models/AllApis.dart';
import '../../../services/fetch_api/remote_service.dart';

class HomeController extends GetxController {
  HomeController({this.context}) {
    _context = context;
    badgeBackgroundColor = Theme.of(_context!).primaryColor.obs;
  }
  //
  static BuildContext? _context = Get.context;
  BuildContext? context;

  // color observable
  late Rx<Color?> badgeBackgroundColor;

  // badge background color tween
  late Rx<ColorTween> badgeBackgroundColorTween = ColorTween(
    begin: badgeBackgroundColor.value,
    end: Theme.of(_context!).scaffoldBackgroundColor,
  ).obs;

  // Future variables to get data once and use it in the app
  late Future<List<CategoryApis>> getAllApisData;

  // Search text editing controller
  late final TextEditingController searchInputController;

  // the crossAxisCount of the grid
  late int crossAxisCount;

  // the scroll controller
  late ScrollController scrollController;

  //
  final int expandedHeight = 140;
  final double sizedBoxHeight = 5;
  final double searchBarHeight = 50;
  @override
  void onInit() {
    // Declare textEditingController
    searchInputController = TextEditingController();

    // initialize the crossAxiCount
    Box localsBox = Hive.box("locals");
    crossAxisCount = localsBox.get("crossAxisCount") ?? 2;

    // Get data and store it in the getAllApisData variable
    getAllApisData = RemoteService.getData();

    //
    scrollControllerInit(_context!);

    //
    ever(badgeBackgroundColorTween, _updateColor);

    super.onInit();
  }

  _updateColor(ColorTween clr) {
    badgeBackgroundColor.value = badgeBackgroundColorTween.value.begin;
  }
}
