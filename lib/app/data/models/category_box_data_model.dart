import 'AllApis.dart';

class CategoryBoxData {
  final String title;
  final String assetPath;
  final List<Api> apis;
  CategoryBoxData({
    required this.title,
    required this.assetPath,
    required this.apis,
  });

  factory CategoryBoxData.errorPlaceholder() {
    return CategoryBoxData(
      apis: [],
      title: "category not found",
      // TODO: add error image
      assetPath: "assets/placeholders/error.png",
    );
  }
}
