import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../services/local_db/hive/hidden_categories_db.dart';
import '../../../controllers/home_controller/home_controller.dart';

class HiddenCategoriesCounter extends GetView<HomeController> {
  const HiddenCategoriesCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(() {
      final currentOpacityValue = controller.opacityValue.value;

      return GestureDetector(
        onTap: () {
          Get.toNamed("/hiddenCategories");
        },
        child: Opacity(
          opacity: currentOpacityValue,
          child: Transform.scale(
            scale: 0.25 + currentOpacityValue,
            child: ValueListenableBuilder(
              valueListenable: HiddenCategoriesDB.instance.listenable(),
              builder: (BuildContext context, Box box, Widget? child) {
                return Text(
                  "${box.length} Hidden",
                  style: theme.textTheme.caption?.copyWith(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 8,
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
