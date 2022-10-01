import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/services/crashlytics/crashlytics.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/analytics/firebas_analytics.dart';

class ApisViewController extends GetxController {
  Analytics analytics = Analytics();
  Crashlytics crashlytics = Crashlytics();

  String apisViewId = "ApisView";


  // Try multiple launch modes
  Future<void> tryMultipleLaunchModes(Uri parsedLink) async {
    // try with external application mode
    try {
      await launchUrl(
        parsedLink,
        mode: LaunchMode.externalApplication,
      );
      return;
    } catch (e) {
      crashlytics.crashlyticsInstance.log(
        "$e, canLaunch: true, but can't launch link in platform external application launch mode",
      );
    }

    // try with in app web view mode
    try {
      await launchUrl(parsedLink,
          mode: LaunchMode.inAppWebView,
          webViewConfiguration: const WebViewConfiguration(
            enableDomStorage: true,
            enableJavaScript: true,
          ));
      return;
    } catch (e) {
      crashlytics.crashlyticsInstance.log(
        "$e, canLaunch: true, but can't launch link in  app web view launch mode",
      );
    }

    // try with platform default
    try {
      await launchUrl(
        parsedLink,
        mode: LaunchMode.platformDefault,
      );
      return;
    } catch (e) {
      crashlytics.crashlyticsInstance.log(
        "$e, canLaunch: true, but can't launch link in platform default launch mode",
      );
    }

    // try with external non browser application mode
    try {
      await launchUrl(
        parsedLink,
        mode: LaunchMode.externalNonBrowserApplication,
      );
      return;
    } catch (e) {
      crashlytics.crashlyticsInstance.log(
        "$e, canLaunch: true, but can't launch link in non browser application mode launch mode",
      );
    }
  }
}
