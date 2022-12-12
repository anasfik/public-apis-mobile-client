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
      CategoryBoxOption.copy(onTap: copyCategoryTitle),
      CategoryBoxOption.bookmarkAllApis(
        onTap: addAllApisToBookmarks,
        category: category,
      ),
      CategoryBoxOption.removeAllCategoryApis(
        onTap: removeAllApisFromBookmarks,
        category: category,
      ),
      CategoryBoxOption.hideCategory(onTap: hideCategory),
      CategoryBoxOption.share(onTap: shareCategory),
    ];
  }
}
