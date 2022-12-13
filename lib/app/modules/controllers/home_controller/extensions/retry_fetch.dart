import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/update.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/home_controller.dart';

import '../../../../services/fetch_api/remote_service.dart';

extension RetryFetchExtension on HomeController {
  void retryGetData() {
    Get.back();
    getAllApisData = RemoteService.getData();
    updateHomeCategoriesGrid();
  }
}
