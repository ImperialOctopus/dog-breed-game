/// Adds indexed map to iterable.
extension IndexedIterable<E> on Iterable<E> {
  /// Map with index.
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}
