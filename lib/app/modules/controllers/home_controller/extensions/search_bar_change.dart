import '../home_controller.dart';

extension SearchBarChangeExtension on HomeController {
  static const String _categoriesGridViewId = "categoriesGridViewId";
  String get categoriesGridViewId => _categoriesGridViewId;
  onSearchBarChange() {
    update([categoriesGridViewId]);
  }
}
