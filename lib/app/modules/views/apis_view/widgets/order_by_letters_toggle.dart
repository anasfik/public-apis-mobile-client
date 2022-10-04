import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/update_order_by_letters.dart';

import 'package:public_apis_desktop_client/app/modules/views/apis_view/widgets/custom_letters_prder_icon.dart';

class OrderByLettersToggle extends GetView<ApisViewController> {
  const OrderByLettersToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApisViewController>(
      id: controller.orderLettersToggleId,
      builder: (controller) {
        return FractionallySizedBox(
          widthFactor: 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ColoredBox(
                color: Colors.transparent,
                child: CustomLettersOrderIcon(
                  orderByLetters: OrderByLetters.AtoZ,
                  boolValue:
                      controller.orderByLettersBoolHashMap["A-Z"] as bool,
                ),
              ),
              CustomLettersOrderIcon(
                boolValue: controller.orderByLettersBoolHashMap["Z-A"] as bool,
                orderByLetters: OrderByLetters.ZtoA,
              ),
            ],
          ),
        );
      },
    );
  }
}
