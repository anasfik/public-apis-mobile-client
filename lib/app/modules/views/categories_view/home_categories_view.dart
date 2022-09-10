import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import 'widgets/search_bar.dart';
import 'widgets/sliver_app_bar.dart';
import 'widgets/sliver_grid.dart';

class HomeCategoriesPage extends GetView<HomeController> {
  const HomeCategoriesPage({Key? key}) : super(key: key);

  static final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focusNode);
        if (focusNode.hasListeners && focusNode.hasPrimaryFocus) {
          focusNode.dispose();
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          controller: controller.scrollController,
          slivers: <Widget>[
            const CustomSliverAppBar(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 5,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverToBoxAdapter(
                child: CustomTextField(
                  hintText: "Ex: Blockchain, Anime, News...",
                  inputController: controller.searchInputController,
                  labelText: "Search",
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: CustomSliverGrid(),
            ),
          ],
        ),
      ),
    );
  }
}