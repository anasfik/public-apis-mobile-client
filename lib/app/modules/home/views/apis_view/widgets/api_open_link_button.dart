import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/home/controllers/apis_view_controller.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

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
      onPressed: () {
        controller.launchLink(link);
      },
      splashColor: Colors.white.withOpacity(.2),
      child: Text(
        TextHelperMethods.firstLettersToCapital(text),
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}