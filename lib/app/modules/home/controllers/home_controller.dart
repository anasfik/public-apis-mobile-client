import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  // Variables
  String _url =
      "https://raw.githubusercontent.com/anasfik/public-apis-json-api/main/result/apis.json";

  Future<String?> getJsonData() async {
    dynamic response = await http.get(
      Uri.parse(_url),
    );
    if (response.statusCode == 200) {
      return response.body;
    }

    // TODO: handle other exceptions
  }
}
