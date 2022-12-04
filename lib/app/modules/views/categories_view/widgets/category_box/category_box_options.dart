import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';
import 'package:public_apis_desktop_client/app/modules/views/categories_view/widgets/category_box/category_box_option_tile.dart';

import 'category_box_close_button.dart';

class CategoryBoxOptions extends GetView<CategoryBoxController> {
  const CategoryBoxOptions({super.key});

  @override
  Widget build(BuildContext context) {
    // copy, share, hide, bookmark all category apis, unbookmark all category apis,

    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: CategoryBoxCloseButton(),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: List.generate(controller.options.length, (index) {
            return CategoryBoxOptionTile(
              option: controller.options[index],
            );
          }),
        ),
      ],
    );
  }
}
