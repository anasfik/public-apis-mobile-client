import '../home_controller.dart';

extension SearchBarChangeExtension on HomeController {
  void onSearchBarChange() {
    update([categoriesGridViewId]);
  }

  List<T> filteredList<T>(
    List rawList,
  ) {
    if (searchInputController.text.isEmpty) {
      return rawList as List<T>;
    }
    final searchFieldInput = searchInputController.text;

    return rawList
        .where(
          (category) => category.title.toLowerCase().startsWith(
                searchFieldInput.toLowerCase(),
              ),
        )
        .toList() as List<T>;
  }
}
