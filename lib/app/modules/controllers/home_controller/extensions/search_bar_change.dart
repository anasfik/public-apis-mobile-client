import 'package:flutter/material.dart';

import '../home_controller.dart';

extension SearchBarChangeExtension on HomeController {
  
  /// this will just update the grid state, since it's linked already with the search bar controller
  void onSearchBarChange() {
    update([categoriesGridViewId]);
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
