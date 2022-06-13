import 'package:equatable/equatable.dart';

import 'answer.dart';

/// Image associated with an answer.
class ImageAnswer extends Equatable {
  /// Answer the image refers to.
  final Answer answer;

  /// Path to image.
  final String imagePath;

  /// Difficulty of this particular image.
  final int difficulty;

  /// Image associated with an answer.
  const ImageAnswer(
      {required this.answer,
      required this.imagePath,
      required this.difficulty});

  @override
  List<Object?> get props => [answer, imagePath, difficulty];
}
