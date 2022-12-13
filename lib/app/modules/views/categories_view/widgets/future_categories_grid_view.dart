import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/calculate_height_reminder.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/generate_asset_path_with_title.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/retry_fetch.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/search_bar_change.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/show_error.dart';
import 'package:public_apis_desktop_client/app/modules/views/categories_view/widgets/retry_manually_widget.dart';

import '../../../../data/models/AllApis.dart';
import '../../../../data/models/category_box_data_model.dart';
import '../../../controllers/category_box_controller/category_box_controller.dart';
import '../../../controllers/home_controller/home_controller.dart';
import '../../general/loading/loading_widget.dart';
import '../../widgets/nil.dart';
import 'category_box/category_box.dart';

class FutureSliverCategoriesGridView extends GetView<HomeController> {
  final Future<List<CategoryApis>> future;
  const FutureSliverCategoriesGridView({
    super.key,
    required this.future,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryApis>>(
      future: future,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<CategoryApis>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget(
            height: controller.calculateReminderHeight(context),
          );
        }

        if (snapshot.hasData) {
          return GetBuilder<HomeController>(
            id: controller.categoriesGridViewId,
            builder: (controller) {
              final resultList = controller.filteredList(
                snapshot.data ?? [],
              );

              return SliverGrid.count(
                crossAxisCount: controller.crossAxisCount,
                childAspectRatio: controller.childAspectRatioBasedOnSetting,
                crossAxisSpacing: 15,
                mainAxisSpacing: controller.mainAxisSpacingBasedOnSetting,
                children: List.generate(
                  resultList.length,
                  (index) {
                    String currentCategoryTitle = resultList[index].title;

                    return CategoryBox(
                      bottomSheetMode: BottomSheetMode.normalBottomSheet,
                      key: ValueKey(index),
                      index: index,
                      data: CategoryBoxData(
                        title: currentCategoryTitle,
                        assetPath: controller
                            .assetPathBasedInTitle(currentCategoryTitle),
                        apis: resultList[index].apis,
                      ),
                    );
                  },
                ),
              );
            },
          );
        }

        if (snapshot.hasError) {
          controller.showErrorDialog(snapshot.error!, context);

          return RetryManuallyWidget(
            height: controller.calculateReminderHeight(context),
            onTap: () {
              controller.retryGetData();
            },
          );
        }

        return const SliverToBoxAdapter(child: Nil());
      },
    );
  }
}
