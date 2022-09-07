import 'package:get/get.dart';

class HomeController extends GetxController {
  double handleFontSizeValue(String text) {
    if (text.length > 20) {
      return 17;
    }
    return 20;
  }
}
