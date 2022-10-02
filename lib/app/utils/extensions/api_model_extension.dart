import '../../data/models/AllApis.dart';

extension ApiBoolExtension on Api {
  bool hasAuth() {
    return auth.toLowerCase() != "no";
  }

  bool isHttps() {
    return https.toLowerCase() == "yes";
  }

  bool isHttp() {
    return !isHttps();
  }

  bool hasCors() {
    return cors.toLowerCase() == "yes";
  }

  bool hasUnknownCors() {
    return cors.toLowerCase() == "unknown";
  }

  bool hasAuthWithApiKey() {
    return auth.toLowerCase() == "apikey";
  }
}
