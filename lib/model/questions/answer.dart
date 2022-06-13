import 'package:equatable/equatable.dart';

import 'category.dart';

/// Possible answer for a question.
class Answer extends Equatable {
  /// Text to describe answer.
  final String name;

  /// Difficulty of this answer.
  final int difficulty;

  /// Categories this belongs to.
  final List<Category> categories;

  /// Possible answer for a question.
  const Answer(
      {required this.name, required this.difficulty, required this.categories});

  @override
  List<Object?> get props => [name, difficulty, categories];
}
