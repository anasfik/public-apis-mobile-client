import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/home_controller.dart';
import 'future_categories_grid_view.dart';

class CustomSliverGrid extends GetView<HomeController> {
  const CustomSliverGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15) +
          const EdgeInsets.only(bottom: 10),
      sliver: FutureSliverCategoriesGridView(
        future: controller.getAllApisData,
      ),
    );
  }
}
