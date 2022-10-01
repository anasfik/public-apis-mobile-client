import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';

extension GenerateIdBasedOnIndexExtension on ApisViewController {
  
  static const  prefixFilterId = "filterChoiceId";
  
  String idBasedOnIndex(int index, [String prefixString = prefixFilterId]) =>
      '$prefixString$index';
}
