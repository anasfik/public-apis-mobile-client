import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/services/remote_service.dart';

import '../../../../../data/models/AllApis.dart';
import '../../../controllers/home_controller.dart';
import '../../widgets/nil.dart';
import 'category_box.dart';

class CustomSliverGrid extends GetView<HomeController> {
  const CustomSliverGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      key: const ValueKey("futureBuilder Key"),
      future: controller.getAllApisData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  140 -
                  5 -
                  30 -
                  50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text("Error"),
          );
        }

        if (snapshot.hasData) {
          List<CategoryApis> result = snapshot.data as List<CategoryApis>;

          return GetBuilder<HomeController>(
            builder: (controller) {
              List<CategoryApis> result2 = result
                  .where(
                    (e) => e.title.toLowerCase().startsWith(
                          controller.searchInputController.text.toLowerCase(),
                        ),
                  )
                  .toList();
              return SliverGrid.count(
                crossAxisCount: 2,
                childAspectRatio: 1.8,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  ...List.generate(
                    result2.length,
                    (index) => CategoryBox(
                      dataList: {
                        "title": result2[index].title,
                        "image": "assets/categoriesImages/animals.jpg",
                      },
                      apis: result2[index].apis,
                    ),
                  )
                ],
              );
            },
          );
        }
        return const SliverToBoxAdapter(child: Nil());
      },
    );
  }
}