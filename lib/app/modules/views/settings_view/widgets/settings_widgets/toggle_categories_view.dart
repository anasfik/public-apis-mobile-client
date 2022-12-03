import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/category_box__setting_controller/category_box__setting_controller.dart';

class ToggleCategoriesView extends GetView<ToggleCategoriesController> {
  const ToggleCategoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(controller.hasOnlyOneSelectedView());

    return GetBuilder<ToggleCategoriesController>(
      builder: ((controller) => Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              children: List.generate(
                controller.viewSettings.length,
                (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.toggleView(
                        index: index,
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInOutQuad,
                      color: Theme.of(context).primaryColor.withOpacity(
                            controller.categoriesViewBool[index] ? 1 : 0.5,
                          ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Icon(
                              controller.viewSettings[index].icon,
                              color: Colors.white.withOpacity(
                                controller.categoriesViewBool[index] ? 1 : 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
