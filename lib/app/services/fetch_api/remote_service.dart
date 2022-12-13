import 'dart:io';
import "package:http/http.dart" as http;
import 'package:public_apis_desktop_client/app/services/crashlytics/crashlytics.dart';
import '../../data/models/AllApis.dart';
import '../../utils/singelton/categories_apis.dart';
import 'failure.dart';

class RemoteService {
  static const _url =
      "https://raw.githubusercontent.com/anasfik/public-apis-json-api/main/result/apis.json";

  static String get url => _url;

  static Future<List<CategoryApis>> getData({String? apiUrl}) async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response = await http.get(Uri.parse(apiUrl ?? _url));
      final categoriesApis = categoriesApisFromJson(response.body);
      CategoriesApisSingleton.all = categoriesApis;

      return categoriesApis;
    } on SocketException {
      throw Failure(
        "no internet connection",
        "check your internet connection and try again",
      );
    } on HttpException {
      throw Failure(
        "no service found",
        "sorry, the service is not available at the moment",
      );
    } on FormatException {
      throw Failure(
        "Invalid Response Format",
        "we're working on this issue, please try again later",
      );
    } catch (e) {
      Crashlytics().crashlyticsInstance.recordError(e, StackTrace.current);
      throw Failure(
        "unknown error",
        "we're trying to fix this issue, please try again later",
      );
    }
  }
}
