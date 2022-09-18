import 'dart:io';

import "package:http/http.dart" as http;
import '../../data/models/AllApis.dart';
import 'failure.dart';

class RemoteService {
  // Variables
  static const String _url =
      "https://raw.githubusercontent.com/anasfik/public-apis-json-api/main/result/apis.json";

  // fetch Method
  static Future<List<CategoryApis>> getData() async {
    await Future.delayed(const Duration(seconds: 5));

    try {
      final response = await http.get(
        Uri.parse(_url),
      );
      return categoriesApisFromJson(response.body);
    } on SocketException {
      throw Failure("no internet connection",
          "check your internet connection and try again");
    } on HttpException {
      throw Failure("no service found",
          "sorry, the service is not available at the moment");
    } on FormatException {
      throw Failure("Invalid Response Format",
          "we're working on this issue, please try again later");
    } catch (e) {
      throw Failure("unknown error",
          "we're trying to fix this issue, please try again later");
    }
  }
}
