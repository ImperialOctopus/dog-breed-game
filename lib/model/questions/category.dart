import 'package:equatable/equatable.dart';

import 'answer.dart';

/// Difficulty category of a question.
class Category extends Equatable {
  /// Text name of this category.
  final String name;

  /// Answers in this category.
  final Set<Answer> answers;

  /// Difficulty category of a question.
  const Category({required this.name, required this.answers});

  @override
  List<Object?> get props => [name, answers];
}
