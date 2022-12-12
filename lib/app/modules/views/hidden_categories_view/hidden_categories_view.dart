import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/AllApis.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/generate_asset_path_with_title.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/home_controller.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/constants/boxes.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../data/models/category_box_data_model.dart';
import '../../../utils/singelton/categories_apis.dart';
import '../../controllers/hidden_categories_controller/hidden_categories_controller.dart';
import '../categories_view/widgets/category_box/category_box.dart';

class HiddenCategoriesView extends GetView<HiddenCategoriesController> {
  const HiddenCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    print("build");
    print(HiveBoxes.hiddenCategoriesBox.values.toList());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "hidden categories".capitalizeAllWordsFirstLetter(),
        ),
      ),
      body: GetBuilder<HiddenCategoriesController>(
        id: controller.HiddenCategoriesGrdId,
        builder: (context) {
          final List<CategoryApis> hiddenCategories = controller
              .filterHiddenCategories(CategoriesApisSingleton.all ?? []);

          if (hiddenCategories.isEmpty) {
            return Center(
              child:
                  Text("no hidden categories".capitalizeAllWordsFirstLetter()),
            );
          }

          final homeController = Get.find<HomeController>();

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GridView.count(
              crossAxisCount: homeController.crossAxisCount,
              childAspectRatio: homeController.childAspectRatioBasedOnSetting,
              crossAxisSpacing: 15,
              mainAxisSpacing: homeController.mainAxisSpacingBasedOnSetting,
              children: List.generate(
                hiddenCategories.length,
                (index) {
                  String currentCategoryTitle = hiddenCategories[index].title;

                  return CategoryBox(
                    bottomSheetMode: BottomSheetMode.hiddenCategoryBottomSheet,
                    key: ValueKey(index),
                    index: index,
                    data: CategoryBoxData(
                      title: currentCategoryTitle,
                      assetPath: homeController
                          .assetPathBasedInTitle(currentCategoryTitle),
                      apis: hiddenCategories[index].apis,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
