class FilterChoiceOption {
  String optionText;
  String apiRelatedValueToCompareWith;
  bool isSelected;

  FilterChoiceOption({
    required this.apiRelatedValueToCompareWith,
    required this.optionText,
    this.isSelected = true,
  });
}
