import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../../../data/models/category_box_option.dart';
import '../../../../controllers/category_box_controller/category_box_option_tile_controller.dart';

class CategoryBoxOptionTile extends GetView<CategoryBoxOptionTileController> {
  final CategoryBoxOption option;
  final bool shouldHaveExtraVerticalPadding;
  final int index;
  const CategoryBoxOptionTile({
    super.key,
    required this.index,
    required this.option,
    this.shouldHaveExtraVerticalPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final id = index.toString();

    return GetBuilder<CategoryBoxOptionTileController>(
      init: CategoryBoxOptionTileController(),
      global: false,
      id: id,
      builder: (controller) {
        return GestureDetector(
          onPanDown: (DragDownDetails details) {
            controller.onPanDown(id);
          },
          onPanCancel: () {
            controller.onPanCancel(id);
          },
          onPanEnd: (DragEndDetails details) {
            controller.onPanEnd(id);
          },
          onPanStart: (DragStartDetails details) {
            controller.onPanStart(id);
          },
        
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: controller.optionTileBgColor ??
                Theme.of(context).bottomSheetTheme.backgroundColor,
            child: Row(
              children: <Widget>[
                Icon(
                  option.icon,
                  color: theme.colorScheme.primary.withOpacity(0.7),
                ),
                const SizedBox(
                  width: 20,
                ),
                AutoSizeText(
                  option.title.capitalizeAllWordsFirstLetter(),
                  style: theme.textTheme.button?.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
