import 'dart:io';

import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ShareAppController extends GetxController {
  final String shareAppText = "Check out this app: ";
  final String playStoreApp =
      "https://play.google.com/store/apps/details?id=com.gwhyyy.publicApis";
  final String appStoreApp = "";

  Future<void> shareApp() async {
    final linkToShare = _appLinkBasedOnPlatform();
    ShareResult share = await Share.shareWithResult(
      'Discover more than 1400+ free API to use, $linkToShare',
    );
    print(share.raw);
  }

  String _appLinkBasedOnPlatform() {
    if (Platform.isAndroid) {
      return playStoreApp;
    } else if (Platform.isIOS) {
      return appStoreApp;
    } else {
      return "";
    }
  }
}
