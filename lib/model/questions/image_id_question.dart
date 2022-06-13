import 'answer.dart';
import 'image_answer.dart';
import 'question.dart';

/// Image identification question for a quiz.
class ImageIdQuestion implements Question {
  /// Answer for this question.
  final ImageAnswer imageAnswer;

  /// List of possible incorrect answers.
  final List<Answer> incorrectAnswers;

  /// Image identification question for a quiz.
  const ImageIdQuestion(
      {required this.imageAnswer, required this.incorrectAnswers});

  @override
  bool isCorrect(Answer _answer) => _answer == imageAnswer.answer;
}
