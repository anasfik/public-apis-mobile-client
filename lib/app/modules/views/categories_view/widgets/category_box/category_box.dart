import 'dart:async';

import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/category_box_data_model.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/generate_category_box_id.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../../bindings/apis_view_binding.dart';
import '../../../../controllers/category_box_controller/category_box_controller.dart';

import '../../../apis_view/apis_view.dart';

class CategoryBox extends GetView<CategoryBoxController> {
  final CategoryBoxData data;
  final int index;
  final ApisViewBinding binding = ApisViewBinding();

  late final String? categoryBoxId =
      controller.generateCategoryBoxId(data, index);

  CategoryBox({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldBackgroundColor = theme.scaffoldBackgroundColor;
    const animationDuration = Duration(milliseconds: 20);

    return GetBuilder<CategoryBoxController>(
      id: categoryBoxId,
      init: CategoryBoxController(),
      global: false,
      builder: (controller) {
        return OpenContainer(
          tappable: false,
          middleColor: scaffoldBackgroundColor,
          transitionDuration: animationDuration,
          transitionType: ContainerTransitionType.fadeThrough,
          closedColor: scaffoldBackgroundColor,
          openColor: scaffoldBackgroundColor,
          onClosed: (value) {
            binding.unbind();
          },
          openBuilder: (context, function) {
            binding.bind();

            return ApisView(
              apis: data.apis,
              category: data.title,
            );
          },
          closedBuilder: (context, openContainer) {
            return AnimatedScale(
              duration: animationDuration,
              curve: Curves.elasticIn,
              scale: controller.scale,
              child: GestureDetector(
                onPanCancel: () {
                  controller.onPanCancel(categoryBoxId ?? "");
                },
                onPanEnd: (DragEndDetails details) {
                  controller.onPanEnd(categoryBoxId ?? "");
                },
                onPanDown: (DragDownDetails details) {
                  controller.onPanDown(categoryBoxId ?? "", data, context);
                  
                },
                onTap: () {
                  openContainer.call();
                },
                // onLongPress: () {
                //   controller.onLongPress(data, context);
                // },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        data.assetPath,
                        fit: BoxFit.cover,
                      ),
                      Material(
                        animationDuration: animationDuration,
                        color: theme.primaryColor.withOpacity(0.4),
                        child: Container(
                          width: double.infinity,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          data.title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headline3?.copyWith(
                            fontSize: data.title.handleFontSizeValue(),
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
