import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/handle_link_launcher.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../controllers/apis_view_controller/apis_view_controller.dart';

class ApiButton extends GetView<ApisViewController> {
  const ApiButton({
    Key? key,
    required this.link,
    this.text = "view",
  }) : super(key: key);

  final String link;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 30,
      minWidth: 60,
      color: Theme.of(context).primaryColor.withOpacity(.45),
      onPressed: () async {
        await controller.handleLaunchLink(link, context);
      },
      splashColor: Colors.white.withOpacity(.2),
      child: Text(
        (text).capitalizeAllWordsFirstLetter(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
