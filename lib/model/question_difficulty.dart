/// Difficulty category of a question.
class QuestionDifficulty {
  /// Enum index.
  final int index;

  /// Text name of this difficulty.
  final String name;

  const QuestionDifficulty._(this.index, this.name);

  /// Create enum from index.
  factory QuestionDifficulty.fromIndex(int _index) => _all[_index];

  @override
  String toString() => name;

  static const List<QuestionDifficulty> _all = [
    beginner,
    intermediate,
    expert,
    challenge,
  ];

  /// Beginner difficulty (1/4)
  static const QuestionDifficulty beginner =
      QuestionDifficulty._(0, 'Beginner');

  /// Intermediate difficulty (2/4)
  static const QuestionDifficulty intermediate =
      QuestionDifficulty._(1, 'Intermediate');

  /// Expert difficulty (3/4)
  static const QuestionDifficulty expert = QuestionDifficulty._(2, 'Expert');

  /// Challenge difficulty (4/4)
  static const QuestionDifficulty challenge =
      QuestionDifficulty._(3, 'Challenge');
}
