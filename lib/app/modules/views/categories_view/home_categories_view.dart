import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/request_new_scaffold_request.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/search_bar_change.dart';
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
    final sizedBoxHeight = controller.sizedBoxHeight;

    return GestureDetector(
      onTap: () {
        controller.removeTextFieldsFocus();
      },
      child: Scaffold(
        floatingActionButton: const CustomFAB(),
        body: CustomScrollView(
          controller: controller.scrollController,
          slivers: <Widget>[
            const CustomSliverAppBar(),
            SliverSizedBox(height: sizedBoxHeight),
            CustomSliverTextField(
              onChanged: (value) {
                controller.onSearchBarChange();
              },
              hintText: "Ex: Blockchain, Anime, News...",
              inputController: controller.searchInputController,
              labelText: "Search",
            ),
            SliverSizedBox(height: sizedBoxHeight * 6),
            const CustomSliverGrid(),
          ],
        ),
      ),
    );
  }
}
