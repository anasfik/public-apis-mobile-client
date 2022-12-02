import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PrivacyController extends GetxController {
  Future<String> privacyContent() async {
    await Future.delayed(const Duration(seconds: 1));
    String privacy =
        await rootBundle.loadString('assets/md_content/privacy.md');

    return privacy;
  }
}
