extension StringExtension on String {
  /// Capitalize the first letter of each word in a string
  ///
  /// ```dart
  /// String example = "hello world".capitalizeAllWordsFirstLetter(); // Hello World
  /// ```

  String capitalizeAllWordsFirstLetter() {
    String lowerCasedString = toLowerCase();
    String stringWithoutExtraSpaces = lowerCasedString.trim();

    if (stringWithoutExtraSpaces.isEmpty) {
      return "";
    }
    if (stringWithoutExtraSpaces.length == 1) {
      return stringWithoutExtraSpaces.toUpperCase();
    }

    List<String> stringWordsList = stringWithoutExtraSpaces.split(" ");
    List<String> capitalizedWordsFirstLetter = stringWordsList
        .map(
          (word) {
            final trimmed = word.trim();

            if (trimmed.isEmpty) return "";

            return trimmed;
          },
        )
        .where(
          (word) => word != "",
        )
        .map(
          (word) {
            if (word.startsWith(RegExp(r'[\n\t\r]'))) {
              return word;
            }

            return word[0].toUpperCase() + word.substring(1).toLowerCase();
          },
        )
        .toList();
    String finalResult = capitalizedWordsFirstLetter.join(" ");

    return finalResult;
  }

  /// Get first word in String
  /// ```dart
  /// String example = "hello world".getFirstWord(); // hello
  /// ```
  String firstWord() {
    return split(' ').first.toLowerCase();
  }

  // This handles the font Size for categories boxes.
  double handleFontSizeValue() {
    if (length > 20) {
      return 17;
    }

    return 20;
  }
}
