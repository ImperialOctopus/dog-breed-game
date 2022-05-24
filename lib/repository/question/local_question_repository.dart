import 'dart:math';

import 'package:dog_breed_game/data/questions/questions.dart';

import '../../model/questions/question.dart';
import 'questions_repository.dart';

/// Implementation of question repository using local questions.
class LocalQuestionsRepository implements QuestionRepository {
  @override
  Question Function() getQuestionGenerator({required int difficulty}) {
    return () {
      return sampleQuestions[Random().nextInt(sampleQuestions.length)];
    };
  }
}
