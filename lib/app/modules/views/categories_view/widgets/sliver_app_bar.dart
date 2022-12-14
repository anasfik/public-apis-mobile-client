import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/text_helper_methods.dart';
import '../../../controllers/home_controller/home_controller.dart';
import 'bookmark_page_icon.dart';
import 'hidden_categories_counter.dart';
import 'settings_page_icon.dart';

class CustomSliverAppBar extends GetView<HomeController> {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      toolbarHeight: kToolbarHeight + 5,
      pinned: true,
      floating: false,
      backgroundColor: theme.primaryColor,
      automaticallyImplyLeading: true,
      expandedHeight: controller.expandedHeight.toDouble(),
      actions: const <Widget>[
        BookmarkPageIcon(),
        SettingsPageIcon(),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(20),
        expandedTitleScale: 1.4,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "categories".capitalizeAllWordsFirstLetter(),
              style: const TextStyle(
                letterSpacing: 1.25,
              ),
            ),
            const HiddenCategoriesCounter(),
          ],
        ),
        background: Container(
          color: theme.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
