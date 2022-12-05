import 'package:flutter/services.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';

import '../../../../data/config/constants.dart';

extension CopyCategoryTitleExtension on CategoryBoxController {
  Future<void> copyCategoryTitle() async {
    final data = CategoryBoxController.currentCategoryData;
    String textToCopy;

    if (data != null) {
      final category = data.title;
      textToCopy = _generateTextToCopy(category);
    } else {
      textToCopy = _generateTextToCopy();
    }
    await _copyToClipBoard(textToCopy);
  }

  Future<void> _copyToClipBoard(String text) async {
    final clipboardData = ClipboardData(text: text);
    await Clipboard.setData(clipboardData);
  }

  String _generateTextToCopy([String? category]) {
    const googlePlayLink = Config.googlePlayLink;

    return category != null
        ? "Check out those $category APIs from the Public APIs app, you can download it from here: $googlePlayLink"
        : "Check out multiple APIs to use from the Public APIs app, you can download it from here: $googlePlayLink";
  }
}
