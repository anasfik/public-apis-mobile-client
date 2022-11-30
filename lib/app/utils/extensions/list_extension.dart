extension ListExtension<T> on List<T>? {
  bool containsOnlyOnce(T value) {
    if (this == null) {
      return false;
    } else {
      int count = 0;
      for (T element in this ?? []) {
        if (element == value) {
          count++;
        }
      }

      return count == 1;
    }
  }
}
