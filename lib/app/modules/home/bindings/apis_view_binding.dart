import 'package:get/get.dart';

import '../controllers/apis_view_controller.dart';

class ApisViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApisViewController>(() => ApisViewController());
  }
}
