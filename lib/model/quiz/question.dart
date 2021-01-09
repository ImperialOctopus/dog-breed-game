/// Question for a quiz.
class Question {
  /// Image path.
  final String imagePath;

  /// List of potential answers.
  final Map<String, bool> answers;

  /// Size of dog.
  final String size;

  /// Rarity of dog.
  final String rarity;

  /// Const constructor.
  const Question({
    required this.imagePath,
    required this.answers,
    required this.size,
    required this.rarity,
  });
}
