import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:public_apis_desktop_client/app/data/models/fab_model.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/init_axis_count.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/init_fab_options_data.dart';
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
  final int expandedHeight = 140;
  final double sizedBoxHeight = 5;
  final double searchBarHeight = 50;
  bool shouldFabShows = false;

  @override
  void onInit() {
    searchInputController = TextEditingController();

    initGridCrossAxisCount();
    initFabOptionsData();
    initScrollController(_context!);

    getAllApisData = RemoteService.getData();

    ever(badgeBackgroundColorTween, _updateColor);
    super.onInit();
  }

  _updateColor(ColorTween clr) {
    badgeBackgroundColor.value = badgeBackgroundColorTween.value.begin;
  }


}
