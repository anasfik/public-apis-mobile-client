import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/try_multiple_launch_methods_extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../services/crashlytics/crashlytics.dart';

extension HandleLaunchLinkExtension on ApisViewController {
  /// Launch link method handler.
  Future<void> handleLaunchLink(String link, context) async {
    final Uri parsedLink = Uri.parse(link);
    final bool canLaunch = await canLaunchUrl(parsedLink);

    if (canLaunch) {
      await tryMultipleLaunchModes(parsedLink);
      _logSuccessfullyOpenedApis(link);
      hiveService.incrementNumberOfApisOpenedByUser();
    } else {
      _showSnackbarOfFailureToUser(context);
      _logUnSuccessfullyOpenedApis(link);
      _recordErrorWithCrashlytics();
    }
  }

  void _showSnackbarOfFailureToUser(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("could not open the API link, we are working to fix it"),
      ),
    );
  }

  void _recordErrorWithCrashlytics() {
    Crashlytics().crashlyticsInstance.recordError(
          Exception("Link not opened / valid"),
          StackTrace.current,
        );
  }

  void _logUnSuccessfullyOpenedApis(String link) {
    analytics.analyticsInstance.logEvent(
      name: "links_not_opened_to_users",
      parameters: {
        "link": link,
      },
    );
  }

  void _logSuccessfullyOpenedApis(String link) {
    analytics.analyticsInstance
        .logEvent(name: "links_opened_to_users_successfully", parameters: {
      "link": link,
    });
  }
}
