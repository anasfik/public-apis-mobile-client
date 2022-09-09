import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class ApisViewController extends GetxController {
  // Launch links method
  Future<void> launchLink(String link) async {
    // Get parsed link
    final Uri parsedLink = Uri.parse(link);

    // Check if link is valid
    if (await canLaunchUrl(parsedLink)) {
      // Then launch
      await launchUrl(
        parsedLink,
        mode: LaunchMode.externalApplication,
      );
    }

   
  }
}
