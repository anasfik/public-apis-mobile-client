import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/update_order_by_letters.dart';

import '../../../controllers/apis_view_controller/apis_view_controller.dart';
import "dart:math" as Math;

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
    return GetBuilder<ApisViewController>(
      global: true,
      id: isAscending.toString(),
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.updateOrderByLettersStatus(isAscending);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    isAscending ? "Z" : "A",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    isAscending ? "A" : "Z",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              Transform.rotate(
                angle: Math.pi,
                child: Icon(
                  Icons.straight,
                  size: 29,
                  color: controller.colorBasedOnIsAscendingStatue(
                    context,
                    isAscending,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
