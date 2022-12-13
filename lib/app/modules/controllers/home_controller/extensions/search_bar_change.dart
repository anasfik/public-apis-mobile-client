import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/update.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/hidden_categories_db.dart';

import '../../../../data/models/AllApis.dart';
import '../home_controller.dart';

extension SearchBarChangeExtension on HomeController {
  String get searchFieldInput => searchInputController.text.toLowerCase();
  HiddenCategoriesDB get hiddenCategoriesDB => HiddenCategoriesDB.instance;

  void onSearchBarChange() {
    updateHomeCategoriesGrid();
  }

  List<CategoryApis> filteredList(
    List<CategoryApis> rawList,
  ) {
    if (_isSearchFieldEmpty() && _isHiddenCategoriesEmpty()) {
      return rawList;
    }

    return _handleListFilter(rawList);
  }

  List<CategoryApis> _handleListFilter(List<CategoryApis> rawList) {
    final resultFilteredList = <CategoryApis>[];

    for (int index = 0; index < rawList.length; index += 1) {
      final currentCategoryTitle = rawList[index].title;

      if (_doesUserSearchFor(currentCategoryTitle)) {
        if (!_shouldCategoryBeExcluded(currentCategoryTitle)) {
          resultFilteredList.add(rawList[index]);
        }
      }
    }

    return resultFilteredList;
  }

  bool _shouldCategoryBeExcluded(String category) {
    return hiddenCategoriesDB.doesKeyExist(category);
  }

  bool _doesUserSearchFor(String text) {
    return text.toLowerCase().startsWith(searchFieldInput.toLowerCase());
  }

  bool _isSearchFieldEmpty() {
    return searchInputController.text.isEmpty;
  }
bool _isHiddenCategoriesEmpty() {
  return hiddenCategoriesDB.isEmpty;
}
}
