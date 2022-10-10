import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/new_update_extension.dart';
import 'package:public_apis_desktop_client/app/modules/views/general/update_general_alert_dialog/update_tile.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../controllers/home_controller/home_controller.dart';

class NewUpdateAlertWidget extends GetView<HomeController> {
  const NewUpdateAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "updated successfully".capitalizeAllWordsFirstLetter(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            "version: 1.2.0",
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
      content: SizedBox(
        height: 250,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: Scrollbar(
            trackVisibility: true,
            interactive: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ...List.generate(
                    controller.featuresList.length,
                    (index) => UpdateTile(
                      feature: controller.featuresList[index].feature,
                      title: controller.featuresList[index].title,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("ok"),
        )
      ],
    );
  }
}
