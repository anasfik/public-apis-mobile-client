import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/Categories/widgets/settings_page_icon.dart';

import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/text_helper_methods.dart';
import '../../../controllers/home_controller.dart';
import 'bookmark_page_icon.dart';
import 'search_bar.dart';

class CustomSliverAppBar extends GetView<HomeController> {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.purple,
      automaticallyImplyLeading: true,
      expandedHeight: 140,
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
