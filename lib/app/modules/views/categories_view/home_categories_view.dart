import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller/home_controller.dart';
import 'widgets/search_bar.dart';
import 'widgets/sliver_app_bar.dart';
import 'widgets/sliver_grid.dart';

final focusNode = FocusNode();

class HomeCategoriesPage extends GetView<HomeController> {
  const HomeCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // this will remove scope whenever we click outside the text field
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
            SliverToBoxAdapter(
              child: SizedBox(
                height: controller.sizedBoxHeight,
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
            SliverToBoxAdapter(
              child: SizedBox(
                height: controller.sizedBoxHeight * 6,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15) +
                  const EdgeInsets.only(bottom: 10),
              sliver: const CustomSliverGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
