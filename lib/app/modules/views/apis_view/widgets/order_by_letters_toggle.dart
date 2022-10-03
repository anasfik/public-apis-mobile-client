import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import "dart:math" as Math;

import 'package:public_apis_desktop_client/app/modules/views/apis_view/widgets/custom_letters_prder_icon.dart';

class OrderByLettersToggle extends GetView<ApisViewController> {
  const OrderByLettersToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const <Widget>[
        CustomLettersOrderIcon(
          isAscending: true,
          iconColor: Colors.black,
        ),
        CustomLettersOrderIcon(
          isAscending: false,
          iconColor: Colors.black,
        ),
      ],
    );
  }
}
