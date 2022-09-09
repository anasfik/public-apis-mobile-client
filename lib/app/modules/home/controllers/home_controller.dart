import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/AllApis.dart';
import '../../../services/remote_service.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // Declare textEditingController
    searchInputController = TextEditingController();

    // Get data and store it in the getAllApisData variable
    getAllApisData = RemoteService.getData();
    super.onInit();
  }

  // Future variables to get data once and use it in the app
  late Future<List<CategoryApis>> getAllApisData;

  // Search text editing controller
  late final TextEditingController searchInputController;


}
