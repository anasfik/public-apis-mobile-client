import 'package:get/get.dart';

import "dart:developer" as developer;

extension CustomLogExtension on GetxController {
  void devLog(String message) {
    developer.log(
      message,
      name: "log",
    );
  }
}

  void devLog(String message) {
    developer.log(
      message,
      name: "log",
    );
  }

