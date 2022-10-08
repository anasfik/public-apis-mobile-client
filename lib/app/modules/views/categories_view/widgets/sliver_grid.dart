import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/generate_asset_path_with_title.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/search_bar_change.dart';
import 'package:public_apis_desktop_client/app/utils/dialog_helper.dart';

import '../../../../data/models/AllApis.dart';
import '../../../../services/fetch_api/failure.dart';
import '../../../../services/fetch_api/remote_service.dart';
import '../../../../utils/text_helper_methods.dart';
import '../../../controllers/home_controller/home_controller.dart';
import '../../widgets/nil.dart';
import 'category_box.dart';
import 'spin_kit.dart';

class CustomSliverGrid extends GetView<HomeController> {
  const CustomSliverGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15) +
          const EdgeInsets.only(bottom: 10),
      sliver: GetBuilder<HomeController>(
        id: controller.categoriesGridViewId,
        builder: (controller) {
          return FutureBuilder<List<CategoryApis>>(
            key: const ValueKey("futureBuilder Key"),
            future: controller.getAllApisData,
            builder: (
              BuildContext context,
              AsyncSnapshot<List<CategoryApis>> snapshot,
            ) {
              bool isWaiting =
                  snapshot.connectionState == ConnectionState.waiting;

              if (isWaiting) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.top -
                        controller.expandedHeight -
                        controller.sizedBoxHeight -
                        (controller.sizedBoxHeight * 6) -
                        controller.searchBarHeight,
                    child: const Center(
                      child: SpinKit(),
                    ),
                  ),
                );
              }

              if (snapshot.hasData) {
                List<CategoryApis> resultList =
                    controller.filteredList<CategoryApis>(
                  snapshot.data!,
                  controllerLinkedWith: controller.searchInputController,
                );

                return SliverGrid.count(
                  crossAxisCount: controller.crossAxisCount,
                  childAspectRatio: controller.crossAxisCount == 2 ? 1.75 : 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing:
                      15 * ((controller.crossAxisCount.toDouble() % 2) + 1),
                  children: [
                    ...List.generate(resultList.length, (index) {
                      String title = resultList[index].title;

                      return CategoryBox(
                        dataMap: {
                          "title": title,
                          "image": controller.assetPathBasedInTitle(title),
                        },
                        apis: resultList[index].apis,
                      );
                    })
                  ],
                );
              }

              // we gonna handle error from remote service class
              if (snapshot.hasError) {
                DialogHelper.showInfoDialog(
                  title: (snapshot.error as Failure).title,
                  context: context,
                  retryButtonMethod: () async {
                    Get.back();
                    controller.getAllApisData = RemoteService.getData();
                    controller.update();
                  },
                  content: (snapshot.error as Failure).content,
                );

                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.top -
                        // this is sum of the widgets height plus the status bar height
                        controller.expandedHeight -
                        controller.sizedBoxHeight -
                        (controller.sizedBoxHeight * 6) -
                        controller.searchBarHeight,
                    child: GestureDetector(
                      onTap: () {
                        controller.update();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.replay,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const Text("Retry"),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const SliverToBoxAdapter(child: Nil());
            },
          );
        },
      ),
    );
  }
}
