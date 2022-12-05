import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/a.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/mixins/category_box_options_mixin.dart';
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
                final current = controller.options[index];

                return GestureDetector(
                  onTap: () async {
                    controller.handleOptionOnTap(context, current);
                  },
                  child: CategoryBoxOptionTile(
                    index: index,
                    option: current,
                  ),
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
