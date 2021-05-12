import 'level.dart';
import 'question.dart';

/// Data for a quiz.
class Quiz extends Level {
  /// List of questions.
  final List<Question> questions;

  /// Data for a quiz.
  const Quiz({
    required String id,
    required String title,
    String? subtitle,
    required String imagePath,
    required this.questions,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
          imagePath: imagePath,
        );
}
