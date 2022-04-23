/// Exception for when a references progress key returns no result.
class ProgressKeyNotFoundException implements Exception {
  /// Message for this exception.
  final String message;

  /// Exception for when a references progress key returns no result.
  const ProgressKeyNotFoundException([this.message = '']);

  @override
  String toString() {
    return 'Progress key not found: ' + message;
  }
}
