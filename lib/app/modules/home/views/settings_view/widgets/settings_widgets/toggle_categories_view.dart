import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/settings_controllers/sub_settings/category_box__setting_controller.dart';

class ToggleCategoriesView extends GetView<ToggleCategoriesController> {
  const ToggleCategoriesView({
    Key? key,
  }) : super(key: key);

  final List<IconData> icons = const [Icons.grid_view_rounded, Icons.view_day];
  @override
  Widget build(BuildContext context) {
    // notice when icons, bool list have different length
    assert(icons.length == controller.categoriesViewBool.length,
        "the defined boolean list length should match the icons length");

    // one element should be true
    assert(
        controller.categoriesViewBool.any((element) => element == true) == true,
        "it should be at least one true value in the boolean list");
    return GetBuilder<ToggleCategoriesController>(
      builder: ((controller) => Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              children: <Widget>[
                ...List.generate(
                  icons.length,
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
                                icons[index],
                                color: Colors.white.withOpacity(
                                  controller.categoriesViewBool[index]
                                      ? 1
                                      : 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
