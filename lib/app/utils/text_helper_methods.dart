class TextHelperMethods {
  static String firstLettersToCapital(String text) {
    String formatedText = text.toLowerCase().trim();

    if (formatedText.isEmpty) return formatedText;
    List<String> words =
        formatedText.split(' ').map((word) => word.trim()).toList();
    List<String> capitalizedFirstLetters = words
        .map((word) => word.substring(0, 1).toUpperCase() + word.substring(1))
        .toList();

    return capitalizedFirstLetters.join(' ');
  }
}
