import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/update_order_by_letters.dart';

import '../../../controllers/apis_view_controller/apis_view_controller.dart';
import "dart:math" as math;

enum OrderByLetters { AtoZ, ZtoA }

class CustomLettersOrderIcon extends GetView<ApisViewController> {
  const CustomLettersOrderIcon({
    super.key,
    required this.orderByLetters,
    required this.boolValue,
  });

  // final controller = Get.find<ApisViewController>();
  final bool boolValue;
  final OrderByLetters orderByLetters;
  @override
  Widget build(BuildContext context) {
    assert(OrderByLetters.values.length == 2);
    return GestureDetector(
      onTap: () {
        controller.updateOrderByLettersStatus(
          orderByLetters == OrderByLetters.ZtoA,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOutExpo,
          height: 45,
          color: controller
                  .colorBasedOnIsAscendingStatue(context, boolValue)
                  ?.withOpacity(.25) ??
              Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      orderByLetters == OrderByLetters.AtoZ ? "A" : "Z",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: controller.colorBasedOnIsAscendingStatue(
                              context,
                              boolValue,
                            ),
                          ),
                    ),
                    Text(
                      orderByLetters == OrderByLetters.AtoZ ? "Z" : "A",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: controller.colorBasedOnIsAscendingStatue(
                              context,
                              boolValue,
                            ),
                          ),
                    ),
                  ],
                ),
              ),
              Transform.rotate(
                angle: math.pi,
                child: Icon(
                  Icons.straight,
                  size: 29,
                  color: controller.colorBasedOnIsAscendingStatue(
                        context,
                        boolValue,
                      ) ??
                      Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
