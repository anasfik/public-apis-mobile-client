import 'dart:convert';

import 'api.dart';

List<Category> welcomeFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String welcomeToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    required this.categoryApis,
    required this.categoryTitle,
  });
  String categoryTitle;
  List<Api> categoryApis;

  factory Category.fromJson(Map<String, dynamic> categoryInJson) {
    return Category(
      categoryTitle: categoryInJson['categoryTitle'] as String,
      categoryApis: List<Api>.from(
        categoryInJson['apis']!.map(
          (x) => Api.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "categoryTitle": categoryTitle,
      "categoryApis": List<dynamic>.from(
        categoryApis.map(
          (x) => x.toJson(),
        ),
      ),
    };
  }
}
