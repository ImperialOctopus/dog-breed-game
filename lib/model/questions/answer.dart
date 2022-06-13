import 'package:equatable/equatable.dart';

import 'answer_image.dart';

/// Possible answer for a question.
class Answer extends Equatable {
  /// Text to describe answer.
  final String name;

  /// Images that relate to this answer.
  final List<AnswerImage> images;

  /// Possible answer for a question.
  const Answer({required this.name, required this.images});

  @override
  List<Object?> get props => [name];
}
