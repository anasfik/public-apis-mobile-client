import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/text_helper_methods.dart';
import '../../../controllers/home_controller/home_controller.dart';
import 'bookmark_page_icon.dart';
import 'settings_page_icon.dart';

class CustomSliverAppBar extends GetView<HomeController> {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Theme.of(context).primaryColor,
      automaticallyImplyLeading: true,
      expandedHeight: controller.expandedHeight.toDouble(),
      actions: const <Widget>[
        BookmarkPageIcon(),
        SettingsPageIcon(),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        expandedTitleScale: 1.4,
        title: Text(
          ("categories").capitalizeAllWordsFirstLetter(),
          style: const TextStyle(
            letterSpacing: 1.25,
          ),
        ),
        background: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
