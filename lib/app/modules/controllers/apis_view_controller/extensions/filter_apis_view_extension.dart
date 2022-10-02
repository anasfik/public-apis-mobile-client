import 'package:public_apis_desktop_client/app/utils/extensions/api_model_extension.dart';

import '../../../../data/models/AllApis.dart';
import '../../../../data/models/filter_choice_option.dart';
import '../apis_view_controller.dart';

extension FilterApisViewExtension on ApisViewController {
  List<Api> filteredApis(List<Api> categoryApis) {
    List<FilterChoiceOption> selectedChoiceOptions = filterOptions
        .where(
          (choiceChip) => choiceChip.isSelected,
        )
        .toList();
    print("categories: ${categoryApis.length}");

    List<Api> result = [];

    if (selectedChoiceOptions.isEmpty) {
      return categoryApis;
    }

    result = categoryApis.where((api) {
      bool isApiValid = false;

      for (FilterChoiceOption selectedChoiceOption in selectedChoiceOptions) {
        if (selectedChoiceOption.optionText == "auth") {
          if (api.hasAuth()) {
            isApiValid = true;
          } else {
            return false;
          }
        }
        if (selectedChoiceOption.optionText.toLowerCase() == "apikey") {
          if (api.hasAuthWithApiKey()) {
            isApiValid = true;
          } else {
            return false;
          }
        }
        if (selectedChoiceOption.optionText == "https") {
          if (api.isHttps()) {
            isApiValid = true;
          } else {
            return false;
          }
        }
        if (selectedChoiceOption.optionText == "http") {
          if (api.isHttp()) {
            isApiValid = true;
          } else {
            return false;
          }
        }
        if (selectedChoiceOption.optionText == "cors") {
          if (api.hasCors() && !api.hasUnknownCors()) {
            isApiValid = true;
          } else {
            return false;
          }
        }
      }
      print("name: ${api.name} isApiValid: $isApiValid");
      print("result: ${result.length}");
      print("${api.name} isApiValid: $isApiValid");
      return isApiValid;
    }).toList();

    return result;
  }
}
