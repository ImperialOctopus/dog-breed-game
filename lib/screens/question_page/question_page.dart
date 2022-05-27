import 'package:flutter/material.dart';

import '../../model/questions/image_id_question.dart';
import '../../model/questions/question.dart';
import 'image_id_question_page.dart';

/// Page to display a question.
class QuestionPage extends StatelessWidget {
  /// Question to display.
  final Question question;

  /// Progress to show on bar at the bottom.
  final double? progress;

  /// Callback when answer button is pressed.
  final Function(bool) onQuestionAnswered;

  /// Button to go to the next question.
  final Widget? nextButton;

  /// Indicate that the quiz is over.
  final bool quizOver;

  /// Page to display a question.
  const QuestionPage({
    Key? key,
    required this.question,
    required this.progress,
    required this.onQuestionAnswered,
    required this.nextButton,
    this.quizOver = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _question = question;

    if (_question is ImageIdQuestion) {
      return ImageIdQuestionPage(
        question: _question,
        progress: progress,
        onQuestionAnswered: onQuestionAnswered,
        nextButton: nextButton,
        quizOver: quizOver,
      );
    }
    throw FallThroughError();
  }
}
