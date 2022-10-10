import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:public_apis_desktop_client/app/data/models/fab_model.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/init_axis_count.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/init_fab_options_data.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/new_update_extension.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/scroll_controller_init.dart';

import '../../../data/models/AllApis.dart';
import '../../../services/fetch_api/remote_service.dart';

class HomeController extends GetxController {
  HomeController({this.context}) {
    _context = context ?? Get.context;
    badgeBackgroundColor = Theme.of(_context!).primaryColor.obs;
  }

  //
  static BuildContext? _context;
  BuildContext? context;

  //
  late Rx<Color?> badgeBackgroundColor;
  late Rx<ColorTween> badgeBackgroundColorTween = ColorTween(
    begin: badgeBackgroundColor.value,
    end: Theme.of(_context!).scaffoldBackgroundColor,
  ).obs;
  late Future<List<CategoryApis>> getAllApisData;
  late final TextEditingController searchInputController;
  late int crossAxisCount;
  late Map<String, FabData> fabOptionsData;
  late ScrollController scrollController;
  late FabData currentFabData = fabOptionsData["down"]!;

  //
  final String fabId = "fabId";
  final int expandedHeight = 140;
  final double sizedBoxHeight = 5;
  final double searchBarHeight = 50;
  bool shouldFabShows = false;
  bool isFirstTimeOpenedTheAppAfterUpdate =
      Hive.box("locals").get("isFirstTimeOpenedTheAppAfterUpdate") ?? true;

  @override
  void onInit() {
    getAllApisData = RemoteService.getData();
    initScrollController(_context!);
    ever(badgeBackgroundColorTween, updateColor);

    searchInputController = TextEditingController();
    initGridCrossAxisCount();
    initFabOptionsData();

    super.onInit();
  }

  @override
  void onReady() {
    if (isFirstTimeOpenedTheAppAfterUpdate) {
      showNewAppUpdateDialog(_context!);
    }
  }

  updateColor(ColorTween clr) {
    badgeBackgroundColor.value = badgeBackgroundColorTween.value.begin;
    print(badgeBackgroundColorTween.value.begin);
  }
}
