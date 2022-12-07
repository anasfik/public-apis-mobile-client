import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/extensions/a.dart';

import '../../../../services/share/share_plus/share_plus.dart';

extension ShareCategoryExtension on CategoryBoxController {
  Future<void> shareCategory() async {
    final data = CategoryBoxController.currentCategoryData;
    final category = data?.title;
    final textToShare = generateTextAboutCategory(category);

    return ShareService.instance.shareText(textToShare);
  }
}
