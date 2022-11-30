import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/request_new_scaffold_request.dart';
import 'package:public_apis_desktop_client/app/modules/views/categories_view/widgets/custom_fab.dart';
import '../../controllers/home_controller/home_controller.dart';
import 'widgets/search_bar.dart';
import 'widgets/sliver_app_bar.dart';
import 'widgets/sliver_grid.dart';
import 'widgets/sliver_sized_box.dart';

class HomeCategoriesPage extends GetView<HomeController> {
  const HomeCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.removeTextFieldFocus(context);
      },
      child: Scaffold(
        floatingActionButton: const CustomFAB(),
        body: CustomScrollView(
          controller: controller.scrollController,
          slivers: <Widget>[
            const CustomSliverAppBar(),
            SliverSizedBox(height: controller.sizedBoxHeight),
            CustomSliverTextField(
              hintText: "Ex: Blockchain, Anime, News...",
              inputController: controller.searchInputController,
              labelText: "Search",
            ),
            SliverSizedBox(height: controller.sizedBoxHeight * 6),
            const CustomSliverGrid(),
          ],
        ),
      ),
    );
  }
}
