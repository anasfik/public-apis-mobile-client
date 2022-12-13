import '../../../../data/config/constants.dart';
import '../category_box_controller.dart';

extension GenerateTextAboutCategoryExtension on CategoryBoxController {
  String generateTextAboutCategory([String? category]) {
    const googlePlayLink = Config.googlePlayLink;

    return category != null
        ? "Check out those $category APIs from the Public APIs app, you can download it from here: $googlePlayLink"
        : "Check out multiple APIs to use from the Public APIs app, you can download it from here: $googlePlayLink";
  }
}
