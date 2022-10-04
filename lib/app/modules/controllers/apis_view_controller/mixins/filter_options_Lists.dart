import '../../../../data/models/filter_choice_option.dart';

mixin FilterOptionsListsInitMixin {
  List<FilterChoiceOption> selectedFilterOptions = [];

  List<FilterChoiceOption> filterOptions = [
    FilterChoiceOption(
      optionText: "auth",
      apiRelatedValueToCompareWith: "no",
    ),
    FilterChoiceOption(
      optionText: "apiKey",
      apiRelatedValueToCompareWith: "no",
    ),
    FilterChoiceOption(
      optionText: "https",
      apiRelatedValueToCompareWith: "no",
    ),
    FilterChoiceOption(
      optionText: "cors",
      apiRelatedValueToCompareWith: "no",
    ),
    FilterChoiceOption(
      optionText: "open source",
      apiRelatedValueToCompareWith: "no",
    ),
    FilterChoiceOption(
      optionText: "http",
      apiRelatedValueToCompareWith: "no",
    ),
  ];
}