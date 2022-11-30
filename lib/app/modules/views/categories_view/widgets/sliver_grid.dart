import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/generate_asset_path_with_title.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/search_bar_change.dart';
import 'package:public_apis_desktop_client/app/modules/views/categories_view/widgets/loading_widget.dart';

import '../../../../data/models/AllApis.dart';
import '../../../../data/models/category_box_data_model.dart';
import '../../../controllers/home_controller/home_controller.dart';
import '../../widgets/nil.dart';
import 'category_box.dart';
import 'retry_manually_widget.dart';

class CustomSliverGrid extends GetView<HomeController> {
  const CustomSliverGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15) +
          const EdgeInsets.only(bottom: 10),
      sliver: FutureBuilder<List<CategoryApis>>(
        
        future: controller.getAllApisData,
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
            final resultList = controller.filteredList<CategoryApis>(
              snapshot.data ?? [],
            );

            return GetBuilder<HomeController>(
              id: controller.categoriesGridViewId,
              builder: (controller) {
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
      ),
    );
  }
}
