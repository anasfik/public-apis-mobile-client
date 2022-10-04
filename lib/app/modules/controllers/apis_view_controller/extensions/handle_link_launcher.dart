import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/try_multiple_launch_methods_extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../services/crashlytics/crashlytics.dart';

extension HandleLaunchLinkExtension on ApisViewController {

  
  /// Launch link method handler
  Future<void> handleLaunchLink(String link, context) async {
    // Get parsed link
    final Uri parsedLink = Uri.parse(
      link,
    );
    final bool canLaunch = await canLaunchUrl(parsedLink);

    // Check if link is valid
    if (canLaunch) {
      // Then launch
      await tryMultipleLaunchModes(parsedLink);

      analytics.analyticsInstance
          .logEvent(name: "links_opened_to_users_successfully", parameters: {
        "link": link,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("could not open the API link, we are working to fix it"),
        ),
      );
      analytics.analyticsInstance.logEvent(
        name: "links_not_opened_to_users",
        parameters: {
          "link": link,
        },
      );

      Crashlytics().crashlyticsInstance.recordError(
            Exception("Link not opened / valid"),
            StackTrace.current,
          );
    }
  }
}
