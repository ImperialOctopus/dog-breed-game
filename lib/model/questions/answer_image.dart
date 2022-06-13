import 'package:equatable/equatable.dart';

/// Image associated with an answer.
class AnswerImage extends Equatable {
  /// Path to image.
  final String imagePath;

  /// Difficulty of this particular image.
  final double difficulty;

  /// Image associated with an answer.
  const AnswerImage({
    required this.imagePath,
    required this.difficulty,
  });

  @override
  List<Object?> get props => [imagePath, difficulty];
}
