/// Returns an iterable with separator between each element.
extension IterableSeparate<E> on Iterable<E> {
  /// Returns an iterable with separator between each element.
  Iterable<E> separate(E separator) {
    if (isEmpty) return this;
    final list = expand((element) => [element, separator]);
    return list.take(list.length - 1);
  }
}
