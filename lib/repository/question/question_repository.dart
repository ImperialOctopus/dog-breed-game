import '../../model/questions/question.dart';

/// Repository for generating questions.
abstract class QuestionRepository {
  /// Get function to generate questions.
  Question Function() getQuestionGenerator({required int difficulty});
}
