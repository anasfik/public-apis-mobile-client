import 'package:public_apis_desktop_client/app/data/models/category_box_data_model.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../home_controller.dart';

extension GenerateCategoryBoxId on HomeController {
  /// this will generate a new id related to each category id
  String generateCategoryBoxId(CategoryBoxData data, int index) {
    return "${data.title.firstWord()}${index}";
  }
}