import 'level.dart';
import 'question.dart';

/// Data for a quiz.
class Quiz extends Level {
  /// List of questions.
  final List<Question> questions;

  /// Data for a quiz.
  const Quiz({
    required String label,
    required String title,
    String? subtitle,
    required String imagePath,
    required this.questions,
  }) : super(
          label: label,
          title: title,
          subtitle: subtitle,
          imagePath: imagePath,
        );
}
