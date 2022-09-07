import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ApisViewController extends GetxController {
  Future<void> launchLink(String link) async {
    final Uri parsedLink = Uri.parse(link);

    if (await canLaunchUrl(parsedLink)) {
      await launchUrl(
        parsedLink,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
