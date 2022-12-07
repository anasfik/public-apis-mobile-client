import 'package:flutter/services.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/a.dart';

import '../../../../data/config/constants.dart';

extension CopyCategoryTitleExtension on CategoryBoxController {
  Future<void> copyCategoryTitle() async {
    final data = CategoryBoxController.currentCategoryData;
    String textToCopy;

    if (data != null) {
      final category = data.title;
      textToCopy = generateTextAboutCategory(category);
    } else {
      textToCopy = generateTextAboutCategory();
    }
    await _copyToClipBoard(textToCopy);
  }

  Future<void> _copyToClipBoard(String text) async {
    final clipboardData = ClipboardData(text: text);
    await Clipboard.setData(clipboardData);
  }


}
