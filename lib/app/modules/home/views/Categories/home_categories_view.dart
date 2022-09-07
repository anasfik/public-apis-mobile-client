// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/Categories/widgets/sliver_app_bar.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/Categories/widgets/sliver_grid.dart';

import '../../controllers/home_controller.dart';

class HomeCategoriesPage extends GetView<HomeController> {
  const HomeCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: const <Widget>[
          CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 5,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            sliver: CustomSliverGrid(),
          ),
        ],
      ),
    );
  }
}
