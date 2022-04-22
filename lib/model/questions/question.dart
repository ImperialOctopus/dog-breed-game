/// Base class for question model.
abstract class Question {
  /// Checks if a submitted answer is correct.
  bool isCorrect(Object answer);
}
