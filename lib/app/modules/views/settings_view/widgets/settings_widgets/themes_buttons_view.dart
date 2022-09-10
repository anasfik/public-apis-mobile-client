import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/settings_controllers/sub_settings/themes_buttons_setting_controller.dart';

class ThemesButtons extends GetView<ThemesButtonsSettingController> {
  const ThemesButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // notice when icons, bool list have different length
    assert(controller.colors.length == controller.themesViewBool.length,
        "the defined boolean list length should match the colors list length");

    // one element should be true
    assert(controller.themesViewBool.any((element) => element == true) == true,
        "it should be at least one true value in the boolean list");
    return GetBuilder<ThemesButtonsSettingController>(
      builder: ((controller) => Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              children: <Widget>[
                ...List.generate(
                  controller.colors.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.chooseTheme(
                          color: controller.colors[index],
                          index: index,
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOutQuad,
                        color: Theme.of(context).primaryColor.withOpacity(
                              controller.themesViewBool[index] ? 1 : 0.5,
                            ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: .3,
                                    color: Colors.white,
                                  ),
                                  color: controller.colors[index],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                width: 20,
                                height: 20,
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
