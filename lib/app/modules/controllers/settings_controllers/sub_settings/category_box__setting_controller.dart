import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../home_controller/home_controller.dart';

class ToggleCategoriesController extends GetxController {
  // locals box
  Box localsBox = Hive.box("locals");

  // a temporary crossAxisCount variable (not the one used directly in the view)
  late int temporaryCrossAxisCount;

  // the list of bool
  late List<bool> categoriesViewBool;

  @override
  void onInit() {
    // init the categoriesViewBool list
    categoriesViewBool = localsBox.get("categoriesViewBool") ?? [true, false];
    super.onInit();
  }

  // method
  void toggleView({required int index}) {
    // fill the list with false
    categoriesViewBool.fillRange(0, categoriesViewBool.length, false);

    // toggle the clicked button with index
    categoriesViewBool[index] = true;

    // save the new list in the box
    localsBox.put("categoriesViewBool", categoriesViewBool);

    // set value based on selected btn (which have true in categoriesViewBool)
    if (categoriesViewBool.first) {
      temporaryCrossAxisCount = 2;
    } else {
      temporaryCrossAxisCount = 1;
    }
    // save it in box
    localsBox.put("crossAxisCount", temporaryCrossAxisCount);

    // set it to the crossAxisCount in the home controller (the one used directly in the view)
    Get.find<HomeController>().crossAxisCount = temporaryCrossAxisCount;

    // then update the view
    final ctl = Get.find<HomeController>();

    ctl.update([ctl.categoriesGridViewId]);
    

    // then Get back to home
    Get.back();
  }
}
