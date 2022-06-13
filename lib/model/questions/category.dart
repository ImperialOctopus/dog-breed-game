/// Difficulty category of a question.
class Category {
  /// Text name of this category.
  final String name;

  const Category._(this.name);

  @override
  String toString() => name;

  /// Most common 10 dogs.
  static const Category mostCommonTen = Category._('Most Common 10 Dogs');
}
