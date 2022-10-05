import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/text_helper_methods.dart';
import '../../../controllers/home_controller/home_controller.dart';
import 'bookmark_page_icon.dart';
import 'settings_page_icon.dart';

class CustomSliverAppBar extends GetView<HomeController> {
  const CustomSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Theme.of(context).primaryColor,
      automaticallyImplyLeading: true,
      expandedHeight: controller.expandedHeight.toDouble(),
      actions: const <Widget>[
        BookmarkPageIcon(),
        SettingsPageIcon(),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(20),
        expandedTitleScale: 1.5,
        title: Text(
          TextHelperMethods.firstLettersToCapital("categories"),
        ),
        background: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
