import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

import '../controllers/apis_view_controller/apis_view_controller.dart';

class ApisViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ApisViewController>(ApisViewController());
    Get.put<FavoritesController>(FavoritesController());
  }

  void bind() {
    dependencies.call();
  }

  void unbind() {
    Get.delete<ApisViewController>();
  }
}
