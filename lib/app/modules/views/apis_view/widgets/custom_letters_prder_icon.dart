import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/update_order_by_letters.dart';

import '../../../controllers/apis_view_controller/apis_view_controller.dart';
import "dart:math" as math;

enum OrderByLetters { AtoZ, ZtoA }

class CustomLettersOrderIcon extends GetWidget<ApisViewController> {
  const CustomLettersOrderIcon({
    super.key,
    required this.orderByLetters,
  });

  final OrderByLetters orderByLetters;
  @override
  Widget build(BuildContext context) {
    bool isAscending = orderByLetters == OrderByLetters.AtoZ;
    assert(OrderByLetters.values.length == 2);
    return GetBuilder<ApisViewController>(
      global: true,
      id: isAscending.toString(),
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.updateOrderByLettersStatus(isAscending);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 45,
              color: controller
                      .colorBasedOnIsAscendingStatue(context, isAscending)
                      ?.withOpacity(.25) ??
                  Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          isAscending ? "A" : "Z",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                color: controller.colorBasedOnIsAscendingStatue(
                                    context, isAscending),
                              ),
                        ),
                        Text(
                          isAscending ? "Z" : "A",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                color: controller.colorBasedOnIsAscendingStatue(
                                    context, isAscending),
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
                            isAscending,
                          ) ??
                          Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
