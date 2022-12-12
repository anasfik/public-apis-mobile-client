import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/handle_option_on_tap.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/category_box_options_extension.dart';
import 'package:public_apis_desktop_client/app/modules/views/categories_view/widgets/category_box/category_box_option_tile.dart';

import 'category_box_close_button.dart';

class NormalCategoryBoxOptions extends GetView<CategoryBoxController> {
  const NormalCategoryBoxOptions({super.key});

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
                final currentOption = controller.options[index];

                return GestureDetector(
                  onTap: () async {
                    controller.handleOptionOnTap(context, currentOption);
                  },
                  child: CategoryBoxOptionTile(
                    index: index,
                    option: currentOption,
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
