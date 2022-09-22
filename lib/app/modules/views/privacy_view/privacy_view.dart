import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../controllers/privacy_controller.dart';

class PrivacyView extends GetView<PrivacyController> {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text(TextHelperMethods.firstLettersToCapital("privacy Policy"))),
      body: Markdown(
        data: PrivacyController.privacyContent,
        selectable: true,
        styleSheet: MarkdownStyleSheet(
          textScaleFactor: 1.25,
        ),
      ),
    );
  }
}
