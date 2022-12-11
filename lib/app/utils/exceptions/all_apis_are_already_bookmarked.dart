class AllApisAreAlreadyBookmarkedException implements Exception {
  final String category;
  final String message;
  AllApisAreAlreadyBookmarkedException({
    required this.category,
    required this.message,
  });
}
