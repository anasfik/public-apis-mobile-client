class UpdateFeature {
  final String title;
  final String feature;
  final UpdateType type;

  UpdateFeature({
    required this.feature,
    required this.type,
    this.title = "new feature",
  });

  String get typeName {
    return type.name;
  }

  String get fullFeatureText {
    return "[ $typeName ], $feature";
  }
}

enum UpdateType {
  add,
  fix,
  remove,
  edit,
  improvement,
}
