import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';
import 'package:public_apis_desktop_client/app/modules/views/categories_view/widgets/category_box/category_box_option_tile.dart';

import 'category_box_close_button.dart';

class CategoryBoxOptions extends GetView<CategoryBoxController> {
  const CategoryBoxOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(controller.options.length, (index) {
                return CategoryBoxOptionTile(
                  index: index,
                  option: controller.options[index],
                );
              }),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        const Positioned(
          right: 0,
          top: 0,
          child: Align(
            alignment: Alignment.centerRight,
            child: CategoryBoxCloseButton(),
          ),
        ),
      ],
    );
  }
}
