/// Potential answer to a question.
class Answer {
  /// Text of the answer.
  final String text;

  /// Whether this is correct.
  final bool correct;

  /// Const constructor.
  const Answer({required this.text, required this.correct});
}
