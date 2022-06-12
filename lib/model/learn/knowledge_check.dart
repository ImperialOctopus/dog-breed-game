import '../quiz/quiz_settings.dart';
import 'level.dart';

/// Data for a quiz.
class KnowledgeCheck extends Level {
  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final String imagePath;

  /// Settings for the quiz.
  final QuizSettings quizSettings;

  /// Data for a quiz.
  const KnowledgeCheck({
    required this.title,
    this.subtitle,
    required this.imagePath,
    required this.quizSettings,
  });

  @override
  List<Object?> get props => [title, subtitle, imagePath, quizSettings];
}
