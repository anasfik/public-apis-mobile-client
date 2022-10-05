import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
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
  const CustomSliverGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: controller.categoriesGridViewId,
      builder: (controller) {
        return FutureBuilder(
          key: const ValueKey("futureBuilder Key"),
          future: controller.getAllApisData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
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
                  child: const Center(
                    child: SpinKit(),
                  ),
                ),
              );
            }
            if (snapshot.hasData) {
              List<CategoryApis> result = snapshot.data as List<CategoryApis>;

              return GetBuilder<HomeController>(
                id: "CategoryApisGridView",
                builder: (controller) {
                  List<CategoryApis> result2 = result
                      .where(
                        (e) => e.title.toLowerCase().startsWith(
                              controller.searchInputController.text
                                  .toLowerCase(),
                            ),
                      )
                      .toList();
                  return SliverGrid.count(
                    crossAxisCount: controller.crossAxisCount,
                    childAspectRatio: controller.crossAxisCount == 2 ? 1.75 : 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing:
                        15 * ((controller.crossAxisCount.toDouble() % 2) + 1),
                    children: [
                      ...List.generate(
                        result2.length,
                        (index) => CategoryBox(
                          dataList: {
                            "title": result2[index].title,
                            "image":
                                "assets/categoriesImages/${TextHelperMethods.getFirstWordOfTitle(
                              title: result2[index].title,
                            )}.jpg",
                          },
                          apis: result2[index].apis,
                        ),
                      )
                    ],
                  );
                },
              );
            }

            /// we gonna handle error from remote service class
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
    );
  }
}
