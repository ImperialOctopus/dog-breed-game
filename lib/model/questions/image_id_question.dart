import 'question.dart';

/// Question for a quiz.
class ImageIdQuestion implements Question {
  /// Image path.
  final String imagePath;

  /// List of potential answers.
  final List<String> answers;

  /// Correct answer index.
  final int _correctAnswer;

  /// Size of dog.
  final String? size;

  /// Rarity of dog.
  final String? rarity;

  @override
  bool isCorrect(Object answer) => answer == _correctAnswer;

  /// Const constructor.
  const ImageIdQuestion({
    required this.imagePath,
    required this.answers,
    required int correctAnswer,
    this.size,
    this.rarity,
  }) : _correctAnswer = correctAnswer;
}
