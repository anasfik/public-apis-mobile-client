
import '../home_controller.dart';

extension SearchBarChangeExtension on HomeController {
  void onSearchBarChange() {
    _filterWithSearchInput();
    update([categoriesGridViewId]);
  }

void _filterWithSearchInput() {

}
  List<T> filteredList<T>(
    List rawList,
  ) {
    if (searchInputController.text.isEmpty) {
      return rawList as List<T>;
    }

    return rawList
        .where(
          (element) => element.title.toLowerCase().startsWith(
                searchInputController.text.toLowerCase(),
              ),
        )
        .toList() as List<T>;
  }
}
