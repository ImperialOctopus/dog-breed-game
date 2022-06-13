import 'dart:math';

import '../model/questions/answer.dart';
import '../model/questions/category.dart';
import '../model/questions/question_forms/image_id_question.dart';
import '../model/questions/question_forms/question.dart';

/// Generator function for questions.
class QuestionGenerator {
  /// Answer pool to generate from.
  final Set<Answer> answers;

  final _random = Random();

  /// Generate questions from a provided answer pool.
  QuestionGenerator(Iterable<Answer> _answers) : answers = _answers.toSet() {
    if (answers.isEmpty) {
      throw ArgumentError('Empty answer pool');
    }
  }

  /// Generate questions from an answer pool within categories.
  factory QuestionGenerator.fromCategories(Iterable<Category> _categories) =>
      QuestionGenerator(_categories.expand((category) => category.answers));

  /// Generate a question of a random type.
  Question generateRandomQuestion() =>
      _allGenerators[_random.nextInt(_allGenerators.length)]();

  List<Question Function()> get _allGenerators => [
        generateImageIdQuestion,
      ];

  /// Generate a random image ID question.
  ImageIdQuestion generateImageIdQuestion() {
    if (answers.length < 4) {
      throw StateError(
          'Cannot generate image ID question with less than four possible answers.');
    }
    final _shuffled = answers.toList()..shuffle(_random);
    final _correctAnswer = _shuffled.take(1).single;
    final _incorrectAnswers = _shuffled.skip(1).take(3).toList();

    final _image = (_correctAnswer.images.toList()..shuffle(_random)).first;

    return ImageIdQuestion(
      correctAnswer: _correctAnswer,
      image: _image,
      incorrectAnswers: _incorrectAnswers,
    );
  }
}
