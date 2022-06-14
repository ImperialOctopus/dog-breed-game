import 'package:equatable/equatable.dart';

/// Image associated with an answer.
class AnswerImage extends Equatable {
  /// Path to image.
  final String imagePath;

  /// Image associated with an answer.
  const AnswerImage({
    required this.imagePath,
  });

  @override
  List<Object?> get props => [imagePath];
}
