import 'package:public_apis_desktop_client/app/utils/extensions/api_model_extension.dart';

import '../../../../data/models/AllApis.dart';
import '../../../../data/models/filter_choice_option.dart';
import '../apis_view_controller.dart';

extension FilterApisViewExtension on ApisViewController {
  List<Api>? filteredApis(List<Api> categoryApis) {
    List<FilterChoiceOption> selectedChoiceOptions = filterOptions
        .where(
          (choiceChip) => choiceChip.isSelected,
        )
        .toList();

    List<Api> result = [];
    // if (selectedChoiceOptions.length == 0) {
    //   return [];
    // }
    if (selectedChoiceOptions.length == 3) {
      return null;
    }

    result = categoryApis.where((api) {
      bool isApiValid = true;
      for (FilterChoiceOption selectedChoiceOption in selectedChoiceOptions) {
        if (selectedChoiceOption.optionText == "auth") {
          if (!api.hasAuth()) {
            isApiValid = false;
          }
        } else if (selectedChoiceOption.optionText == "https") {
          if (!api.isHttps()) {
            isApiValid = false;
          }
        } else if (selectedChoiceOption.optionText == "cors") {
          if (!api.hasCors() || api.hasUnknownCors()) {
            isApiValid = false;
          }
        }
      }
      return isApiValid;
    }).toList();

    return result;
  }
}
