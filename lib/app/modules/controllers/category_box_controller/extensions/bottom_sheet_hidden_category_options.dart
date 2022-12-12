import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/copyCategoryTitle.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/hide_category.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/share_category.dart';

import '../../../../data/models/category_box_option.dart';

extension HiddenCategoryOptionsExtension on CategoryBoxController {
  List<CategoryBoxOption> get hiddenCategoryOptions {
    final category = CategoryBoxController.currentCategoryData!.title;

    return <CategoryBoxOption>[
      CategoryBoxOption.copy(onTap: copyCategoryTitle),
      CategoryBoxOption.share(onTap: shareCategory),
      CategoryBoxOption.showCategory(onTap: showCategory)
      ];
  }
}
