import '../answer.dart';
import '../answer_image.dart';
import 'question.dart';

/// Image identification question for a quiz.
class ImageIdQuestion implements Question {
  /// Answer for this question.
  final Answer correctAnswer;

  /// Image to test.
  final AnswerImage image;

  /// List of possible incorrect answers.
  final List<Answer> incorrectAnswers;

  /// All answers.
  Iterable<Answer> get allAnswers => [correctAnswer, ...incorrectAnswers];

  /// Image identification question for a quiz.
  const ImageIdQuestion(
      {required this.correctAnswer,
      required this.image,
      required this.incorrectAnswers});

  @override
  bool isCorrect(Answer _answer) => _answer == correctAnswer;
}
