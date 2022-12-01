import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../home_controller.dart';

extension GenerateAssetPathBasedInTitle on HomeController {
  String assetPathBasedInTitle(
    String title, {
    String imageFilExtension = "jpg",
  }) {
    const categoriesImagesFolderName = "categoriesImages";
    final imageName = title.firstWord();

    return "assets/$categoriesImagesFolderName/$imageName.$imageFilExtension";
  }
}
