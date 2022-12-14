import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/fab_model.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/init_axis_count.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/init_fab_options_data.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/new_update_extension.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/scroll_controller_init.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/update.dart';

import '../../../data/models/AllApis.dart';
import '../../../services/fetch_api/remote_service.dart';
import '../../../services/in_app_review/in_app_review.dart';
import '../../../services/local_db/hive/locals_box.dart';

class HomeController extends GetxController {
  BuildContext? context;
  LocalsDB locals = LocalsDB.instance;

  final FocusNode focusNode = FocusNode();
  final String fabId = "fabId";
  final int expandedHeight = 140;
  final double sizedBoxHeight = 5;
  final double searchBarHeight = 50;

  bool shouldFabShows = false;

  Rx<double> opacityValue = 1.0.obs;
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
  final categoriesGridViewId = "categoriesGridViewId";

  final _hiveService = InAppReview();
  static BuildContext? _context;

  bool get isFirstTimeOpenedTheAppAfterUpdate =>
      locals.getWithKey("isFirstTimeOpenedTheAppAfterUpdate") ?? true;

  double get childAspectRatioBasedOnSetting => crossAxisCount == 2 ? 1.75 : 3;
  double get mainAxisSpacingBasedOnSetting =>
      15 * ((crossAxisCount.toDouble() % 2) + 1);

  HomeController({this.context}) {
    _context = context ?? Get.context;
    badgeBackgroundColor = Theme.of(_context!).primaryColor.obs;
  }

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
    _hiveService.handleShowingTheReviewRequest();
  }
}
