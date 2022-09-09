import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/AllApis.dart';
import '../../../services/remote_service.dart';

class HomeController extends GetxController {
  late Future<List<CategoryApis>>  getAllApisData;
  @override
  void onInit() async {
    searchInputController = TextEditingController();
getAllApisData = RemoteService.getData();
    super.onInit();
  }

 

  // Search text editing controller
  late final TextEditingController searchInputController;

  double handleFontSizeValue(String text) {
    if (text.length > 20) {
      return 17;
    }
    return 20;
  }
}
