import 'package:flutter/material.dart';

import '../home_controller.dart';

extension SearchBarChangeExtension on HomeController {
  static const String _categoriesGridViewId = "categoriesGridViewId";
  String get categoriesGridViewId => _categoriesGridViewId;

  /// this will just update the grid state, since it's linked already with the search bar controller
  void onSearchBarChange() {
    update([categoriesGridViewId]);
  }

  List<T> filteredList<T>(
    List rawList, {
    required TextEditingController controllerLinkedWith,
  }) {
    if (controllerLinkedWith.text.isEmpty) {
      return rawList as List<T>;
    }
    return rawList
        .where(
          (element) => element.title.toLowerCase().startsWith(
                controllerLinkedWith.text.toLowerCase(),
              ),
        )
        .toList() as List<T>;
  }
}
