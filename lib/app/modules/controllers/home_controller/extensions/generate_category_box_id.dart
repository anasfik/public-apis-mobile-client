import 'package:public_apis_desktop_client/app/data/models/category_box_data_model.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../home_controller.dart';

extension GenerateCategoryBoxId on HomeController {
  /// This will generate a new id related to each category id.
  String generateCategoryBoxId(CategoryBoxData data, int index) {
    final firstWord = data.title.firstWord();
    return "$firstWord$index";
  }
}
