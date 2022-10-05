import '../home_controller.dart';

extension SearchBarChangeExtension on HomeController {
  static const String _categoriesGridViewId = "categoriesGridViewId";
  String get categoriesGridViewId => _categoriesGridViewId;
  onSearchBarChange() {
    update([categoriesGridViewId]);
  }

  List<T> filteredList<T>(List list) {
    if (searchInputController.text.isEmpty) {
      return list as List<T>;
    }
    return list
        .where(
          (element) => element.title.toLowerCase().startsWith(
                searchInputController.text.toLowerCase(),
              ),
        )
        .toList() as List<T>;
  }
}
