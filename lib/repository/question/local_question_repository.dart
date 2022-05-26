import 'dart:math';

import '../../data/questions/questions.dart';
import '../../model/questions/question.dart';
import 'question_repository.dart';

/// Implementation of question repository using local questions.
class LocalQuestionRepository implements QuestionRepository {
  @override
  Question Function() getQuestionGenerator({required int difficulty}) {
    return () {
      return sampleQuestions[Random().nextInt(sampleQuestions.length)];
    };
  }
}
