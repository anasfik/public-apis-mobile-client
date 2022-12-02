import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/views/categories_view/widgets/loading_widget.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../controllers/privacy_controller/privacy_controller.dart';

class PrivacyView extends GetView<PrivacyController> {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "privacy Policy".capitalizeAllWordsFirstLetter(),
        ),
      ),
      body: FutureBuilder<String>(
        future: controller.privacyContent(),
        builder: (_, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget(
              isSliverChild: false,
            );
          }
          if (snapshot.hasData) {
            return Markdown(
              data: snapshot.data ?? "this sentence won't never be shown ",
              selectable: true,
              styleSheet: MarkdownStyleSheet(
                textScaleFactor: 1.25,
              ),
            );
          }

          return const Center(
            child: Text("something went wrong"),
          );
        },
      ),
    );
  }
}
