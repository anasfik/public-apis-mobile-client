import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/data/models/category_box_option.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/add_category_apis_to_bookmarks.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/copyCategoryTitle.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/hide_category.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/share_category.dart';

import '../category_box_controller.dart';

extension CategoryBoxOptionsMixin on CategoryBoxController {
  List<CategoryBoxOption> get options {
    final category = CategoryBoxController.currentCategoryData!.title;

    return <CategoryBoxOption>[
      CategoryBoxOption(
        title: "copy",
        icon: Icons.copy,
        onTap: copyCategoryTitle,
        onErrorText: "cannot copy category, please try again",
        onSuccessText: "Copied!",
      ),
      CategoryBoxOption(
        title: "bookmark all apis",
        icon: Icons.bookmark_add,
        onTap: addAllApisToBookmarks,
        onErrorText: "cannot add apis to bookmarks, please try again",
        onSuccessText: "$category apis added to bookmarks",
      ),
      CategoryBoxOption(
        title: "remove all apis from bookmarks",
        icon: Icons.bookmark_remove,
        onTap: removeAllApisFromBookmarks,
        onErrorText: "cannot remove apis from bookmarks, please try again",
        onSuccessText: "$category apis removed from bookmarks",
      ),
      CategoryBoxOption(
        title: "hide this category",
        icon: Icons.visibility_off,
        onTap: hideCategory,
        onErrorText: "cannot hide category, please try again",
        onSuccessText:
            "Category hidden successfully, you can show it again from the settings",
      ),
      CategoryBoxOption(
        title: "share",
        icon: Icons.share,
        onTap: shareCategory,
        onErrorText: "cannot share, please try again",
        onSuccessText: "Shared!",
      ),
    ];
  }
}
