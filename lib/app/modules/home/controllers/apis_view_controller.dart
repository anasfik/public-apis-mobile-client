import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class ApisViewController extends GetxController {
  // launch links method
  Future<void> launchLink(String link) async {
    // get parsed link
    final Uri parsedLink = Uri.parse(link);

    // check if link is valid
    if (await canLaunchUrl(parsedLink)) {
      // then launch
      await launchUrl(
        parsedLink,
        mode: LaunchMode.externalApplication,
      );
    }

   
  }
}
