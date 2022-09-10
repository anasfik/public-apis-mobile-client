import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../data/models/AllApis.dart';
import '../../../services/remote_service.dart';

class HomeController extends GetxController {
  // localsBox
  Box localsBox = Hive.box("locals");

  @override
  void onInit() {
    // Declare textEditingController
    searchInputController = TextEditingController();

    // initialize the crossAxiCount
    crossAxisCount = localsBox.get("crossAxisCount") ?? 2;

    // Get data and store it in the getAllApisData variable
    getAllApisData = RemoteService.getData();
    super.onInit();
  }

  // Future variables to get data once and use it in the app
  late Future<List<CategoryApis>> getAllApisData;

  // Search text editing controller
  late final TextEditingController searchInputController;

  // the crossAxisCount of the grid
  late int crossAxisCount;
}
