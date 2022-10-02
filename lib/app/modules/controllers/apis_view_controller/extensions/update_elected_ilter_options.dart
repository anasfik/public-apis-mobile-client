import '../apis_view_controller.dart';

extension UpdateSelectedFilterOptionsListExtension on ApisViewController {
  void updateSelectedFilterOptionsList() {
    selectedFilterOptions = filterOptions
        .where(
          (choiceChip) => choiceChip.isSelected,
        )
        .toList();
  }
}
