import 'package:flutter/material.dart';

import '../../components/fixed_height_cover_box.dart';
import '../../model/questions/answer.dart';
import '../../model/questions/question_forms/image_id_question.dart';
import '../../theme/animation.dart';
import '../../theme/answer_button_theme.dart';

/// Page to display a single question.
class ImageIdQuestionPage extends StatefulWidget {
  /// Question to display.
  final ImageIdQuestion question;

  /// Progress to show on bar at the bottom.
  final double? progress;

  /// Callback when answer button is pressed.
  final void Function(bool) onQuestionAnswered;

  /// Button for next page.
  final Widget? nextButtonContent;

  /// Callback for next button.
  final void Function() onNextPressed;

  /// Change appearance for quiz ended.
  final bool quizOver;

  /// Page to display a single question.
  const ImageIdQuestionPage({
    required this.question,
    required this.progress,
    required this.onQuestionAnswered,
    required this.nextButtonContent,
    required this.onNextPressed,
    required this.quizOver,
  });

  static const _switcherDuration = AnimationTheme.quizSwitcherDuration;
  static const _progressSlideDuration = AnimationTheme.progressSlideDuration;

  @override
  _ImageIdQuestionPageState createState() => _ImageIdQuestionPageState();
}

class _ImageIdQuestionPageState extends State<ImageIdQuestionPage> {
  /// Answer the player chose.
  Answer? chosenAnswer;

  late List<Answer> _answers;

  @override
  void initState() {
    super.initState();

    _answers = widget.question.allAnswers.toList()..shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: ImageIdQuestionPage._switcherDuration,
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          switchOutCurve: const Threshold(0),
          switchInCurve: Curves.ease,
          child: FixedHeightCoverBox(
            key: ValueKey<String>(widget.question.image.imagePath),
            height: 300,
            child: Image.asset(widget.question.image.imagePath),
          ),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
              begin: 0, end: widget.quizOver ? 1 : widget.progress),
          duration: ImageIdQuestionPage._progressSlideDuration,
          builder: (context, progress, _) =>
              LinearProgressIndicator(value: progress),
        ),
        //DogInfoBar(size: widget.question.size, rarity: widget.question.rarity),
        Expanded(
          child: AnimatedSwitcher(
              duration: ImageIdQuestionPage._switcherDuration,
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              switchOutCurve: const Threshold(0),
              switchInCurve: Curves.ease,
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(children: [
                              Expanded(child: _answerButton(_answers[0])),
                              Expanded(child: _answerButton(_answers[1])),
                            ]),
                            Row(children: [
                              Expanded(child: _answerButton(_answers[2])),
                              Expanded(child: _answerButton(_answers[3])),
                            ]),
                          ]),
                    ],
                  ),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Visibility(
              visible: chosenAnswer != null,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: ElevatedButton(
                  onPressed: _onNextPressed, child: widget.nextButtonContent),
            ),
          ),
        ),
      ],
    );
  }

  Widget _answerButton(Answer answer) {
    return AnimatedTheme(
      data: ThemeData(outlinedButtonTheme: _buttonStyle(answer)),
      duration: const Duration(milliseconds: 200),
      child: OutlinedButton(
        onPressed: () => _onAnswerPressed(answer),
        child: Text(answer.name),
      ),
    );
  }

  OutlinedButtonThemeData? _buttonStyle(Answer thisAnswer) {
    if (chosenAnswer == null) {
      return answerDefaultStyle;
    }
    if (widget.question.isCorrect(thisAnswer)) {
      return answerCorrectStyle;
    }
    if (thisAnswer == chosenAnswer) {
      return answerIncorrectStyle;
    }
    return answerDefaultStyle;
  }

  void _onAnswerPressed(Answer answer) {
    if (chosenAnswer != null) return;
    setState(() {
      chosenAnswer = answer;
    });
    widget.onQuestionAnswered(widget.question.isCorrect(answer));
  }

  void _onNextPressed() {
    setState(() {
      chosenAnswer = null;
    });
    widget.onNextPressed();
  }
}
