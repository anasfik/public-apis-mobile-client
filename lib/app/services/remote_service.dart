import 'dart:convert';

import "package:http/http.dart" as http;

import '../data/models/AllApis.dart';

class RemoteService {
  // Variables
  static const String _url =
      "https://raw.githubusercontent.com/anasfik/public-apis-json-api/main/result/apis.json";

  // fetch Method
  static getData() async {
    try {
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        return categoriesApisFromJson(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    }
    // TODO: handle other errors
    catch (e) {
      print(e);
    }
  }
}
