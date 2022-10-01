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
          if (api.auth.toLowerCase() ==
              selectedChoiceOption.apiRelatedValueToCompareWith) {
            isApiValid = false;
          }
        } else if (selectedChoiceOption.optionText == "https") {
          if (api.https.toLowerCase() ==
              selectedChoiceOption.apiRelatedValueToCompareWith) {
            isApiValid = false;
          }
        } else if (selectedChoiceOption.optionText == "cors") {
          if (api.cors.toLowerCase() ==
              selectedChoiceOption.apiRelatedValueToCompareWith) {
            isApiValid = false;
          }
        }
      }
      return isApiValid;
    }).toList();

    return result;
  }
}
