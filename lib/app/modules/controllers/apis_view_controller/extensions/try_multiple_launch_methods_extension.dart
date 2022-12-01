import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import 'package:url_launcher/url_launcher.dart';

extension TryMultipleLaunchModesExtension on ApisViewController {
  /// Try multiple launch modes to avoid non working open links on some devices.
  Future<void> tryMultipleLaunchModes(Uri parsedLink) async {
    // Try with external application mode.
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

    // Try with in app web view mode.
    try {
      await launchUrl(
        parsedLink,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(
          enableDomStorage: true,
          enableJavaScript: true,
        ),
      );
      return;
    } catch (e) {
      crashlytics.crashlyticsInstance.log(
        "$e, canLaunch: true, but can't launch link in  app web view launch mode",
      );
    }

    // Try with platform default.
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

    // Try with external non browser application mode.
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
