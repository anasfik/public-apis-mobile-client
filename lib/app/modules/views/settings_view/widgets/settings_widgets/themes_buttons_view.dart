import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/themes_buttons_setting_controller/themes_buttons_setting_controller.dart';

class ThemesButtons extends GetView<ThemesButtonsSettingController> {
  const ThemesButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    assert(
      controller.hasOnlyOneSelectedOption,
      "it should be at least one true value in the boolean list",
    );

    return GetBuilder<ThemesButtonsSettingController>(
      builder: ((controller) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          width: MediaQuery.of(context).size.width * 0.6,
          child: Row(
            children: List<Widget>.generate(
              controller.colors?.length ?? 0,
              (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.chooseTheme(
                        color: controller.colors?[index] ?? Colors.white,
                        index: index,
                      );
                    },
                    child: AnimatedContainer(
                      duration: controller.selectingAnimationDuration,
                      curve: controller.selectingAnimationCurve,
                      color: Theme.of(context).primaryColor.withOpacity(
                            controller.themeOptionSelectedBool?[index] ?? true
                                ? 1
                                : 0.5,
                          ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                border: const Border.fromBorderSide(
                                  BorderSide(
                                    width: 0.3,
                                    color: Colors.white,
                                  ),
                                ),
                                color:
                                    controller.colors?[index] ?? Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
