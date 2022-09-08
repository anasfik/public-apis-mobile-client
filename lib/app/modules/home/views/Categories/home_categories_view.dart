// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/Categories/widgets/sliver_app_bar.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/Categories/widgets/sliver_grid.dart';

import '../../controllers/home_controller.dart';
import 'widgets/search_bar.dart';

class HomeCategoriesPage extends GetView<HomeController> {
  const HomeCategoriesPage({Key? key}) : super(key: key);

  static final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focusNode);
        if(focusNode.hasListeners && focusNode.hasPrimaryFocus) focusNode.dispose();
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            CustomSliverAppBar(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 5,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
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
                height: 30,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: CustomSliverGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
