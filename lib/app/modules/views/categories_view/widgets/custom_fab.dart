import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/fab_model.dart';
import '../../../controllers/home_controller/home_controller.dart';

class CustomFAB extends GetView<HomeController> {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: controller.fabId,
      builder: (context) {
        return AnimatedScale(
          duration: const Duration(milliseconds: 150),
          scale: controller.shouldFabShows ? 1 : 0,
          child: FloatingActionButton(
            onPressed: controller.currentFabData.callback,
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 75),
              curve: Curves.easeInOut,
              turns:
                  controller.currentFabData.direction == FabDirectionOption.up
                      ? 0
                      : 1 / 2,
              child: const Icon(
                Icons.keyboard_arrow_up,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

