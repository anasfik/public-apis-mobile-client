import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/data/models/category_box_option.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/copyCategoryTitle.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/hide_category.dart';

import '../category_box_controller.dart';

extension CategoryBoxOptionsMixin on CategoryBoxController {
  List<CategoryBoxOption> get options => <CategoryBoxOption>[
        CategoryBoxOption(
          title: "copy",
          icon: Icons.copy,
          onTap: copyCategoryTitle,
          onErrorText: "cannot copy category, please try again",
          onSuccessText: "Copied!",
        ),
        CategoryBoxOption(
          title: "hide category",
          icon: Icons.visibility_off,
          onTap: hideCategory,
          onErrorText: "cannot hide category, please try again",
          onSuccessText:
              "Category hidden successfully, you can show it again from the settings",
        ),
        CategoryBoxOption(
          title: "add all apis to bookmarks",
          icon: Icons.bookmark_add,
          onTap: () {
            return Future.value();
          },
        ),
        CategoryBoxOption(
          title: "remove all apis from bookmarks",
          icon: Icons.bookmark_remove,
          onTap: () {
            return Future.value();
          },
        ),
        CategoryBoxOption(
          title: "share",
          icon: Icons.share,
          onTap: () {
            return Future.value();
          },
        ),
      ];
}
