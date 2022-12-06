import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/home_controller.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/hidden_categories_db.dart';

extension HiddenCategoriesCounterExtension on HomeController {


int get hiddenCategoriesCounter {
    return HiddenCategoriesDB.instance.length;
  }
}