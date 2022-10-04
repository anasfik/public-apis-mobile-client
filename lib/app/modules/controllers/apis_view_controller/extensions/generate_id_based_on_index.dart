import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';

extension GenerateIdBasedOnIndexExtension on ApisViewController {
  String idBasedOnIndex(int index, String prefixString) {
    return '$prefixString$index';
  }
}
