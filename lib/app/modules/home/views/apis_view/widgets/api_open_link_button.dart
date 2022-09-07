import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/home/controllers/apis_view_controller.dart';

class ApiButton extends StatelessWidget {
  ApiButton({
    Key? key,
    required this.link,
  }) : super(key: key);

  final ApisViewController controller = Get.put(ApisViewController());
  final String link;
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
        'View',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
