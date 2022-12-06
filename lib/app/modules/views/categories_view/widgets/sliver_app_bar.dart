import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/constants/boxes.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/hidden_categories_db.dart';
import '../../../../utils/text_helper_methods.dart';
import '../../../controllers/home_controller/home_controller.dart';
import 'bookmark_page_icon.dart';
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
            Obx(() {
              final currentOpacityValue = controller.opacityValue.value;

              return Opacity(
                opacity: currentOpacityValue,
                child: Transform.scale(
                  scale: 0.25 + currentOpacityValue,
                  child: ValueListenableBuilder(
                    valueListenable: HiddenCategoriesDB.instance.listenable(),
                    builder: (BuildContext context, Box box, Widget? child) {
                      return Text(
                        "${box.length} Hidden",
                        style: theme.textTheme.caption?.copyWith(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 8,
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
          ],
        ),
        background: Container(
          color: theme.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
