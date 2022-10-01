import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/services/crashlytics/crashlytics.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/analytics/firebas_analytics.dart';

class ApisViewController extends GetxController {
  Analytics analytics = Analytics();
  Crashlytics crashlytics = Crashlytics();

  String apisViewId = "ApisView";


 
}
