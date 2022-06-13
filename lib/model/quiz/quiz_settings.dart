import 'package:equatable/equatable.dart';

import '../questions/category.dart';

/// Settings for a practice quiz.
class QuizSettings extends Equatable {
  /// Number of questions to run. Null equates to no limit.
  final int? questionNumber;

  /// Categories to include.
  final List<Category> categories;

  /// Number of lives to allow.
  final int? lives;

  /// Settings for a practice quiz.
  const QuizSettings({
    required this.questionNumber,
    required this.categories,
    required this.lives,
  });

  @override
  List<Object?> get props => [questionNumber, categories, lives];
}
