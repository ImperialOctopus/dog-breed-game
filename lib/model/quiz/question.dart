import 'answer.dart';

/// Question for a quiz.
class Question {
  /// Text of question.
  final String question;

  /// List of potential answers.
  final List<Answer> answers;

  /// Const constructor.
  const Question({required this.question, required this.answers});
}
