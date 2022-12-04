import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/category_box_controller/close_button_controller.dart';

class CategoryBoxCloseButton extends GetView<CloseButtonController> {
  const CategoryBoxCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (DragDownDetails details) {
        controller.onPanDown();
      },
      onPanCancel: () {
        controller.onPanCancel();
      },
      onPanStart: (DragStartDetails details) {
        controller.onPanStart();
      },
      onPanEnd: (DragEndDetails details) {
        controller.onPanEnd();
      },
      child: GetBuilder<CloseButtonController>(
        id: controller.id,
        builder: (controller) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: ClipOval(
              child: AnimatedContainer(
                padding: const EdgeInsets.all(8),
                duration: const Duration(milliseconds: 200),
                color: controller.closeButtonColor,
                child: const Icon(Icons.close),
              ),
            ),
          );
        },
      ),
    );
  }
}
