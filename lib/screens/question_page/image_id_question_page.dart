import 'package:flutter/material.dart';

import '../../components/fixed_height_cover_box.dart';
import '../../model/questions/image_id_question.dart';
import '../../theme/animation.dart';
import '../../theme/answer_button_theme.dart';

/// Page to display a single question.
class ImageIdQuestionPage extends StatefulWidget {
  /// Question to display.
  final ImageIdQuestion question;

  /// Progress to show on bar at the bottom.
  final double progress;

  /// Callback when answer button is pressed.
  final Function(bool) onQuestionAnswered;

  /// Callback when next button is pressed.
  final Function() onNextPressed;

  /// Page to display a single question.
  const ImageIdQuestionPage({
    required this.question,
    required this.progress,
    required this.onQuestionAnswered,
    required this.onNextPressed,
  });

  static const _switcherDuration = quizSwitcherDuration;
  static const _progressSlideDuration = Duration(milliseconds: 100);

  @override
  _ImageIdQuestionPageState createState() => _ImageIdQuestionPageState();
}

class _ImageIdQuestionPageState extends State<ImageIdQuestionPage> {
  /// Answer the player chose.
  int? chosenAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
              key: ValueKey<String>(widget.question.imagePath),
              height: 300,
              child: Image.asset(widget.question.imagePath),
            ),
          ),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: widget.progress),
            duration: ImageIdQuestionPage._progressSlideDuration,
            builder: (context, progress, _) =>
                LinearProgressIndicator(value: progress),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(5), child: Icon(Icons.rule)),
                    Text(widget.question.size ?? '???'),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(5), child: Icon(Icons.people)),
                    Text(widget.question.rarity ?? '???'),
                  ],
                )),
              ],
            ),
          ),
          Expanded(
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
                          Expanded(child: _answerButton(0)),
                          Expanded(child: _answerButton(1)),
                        ]),
                        Row(children: [
                          Expanded(child: _answerButton(2)),
                          Expanded(child: _answerButton(3)),
                        ]),
                      ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(child: _nextPageButton()),
          ),
        ],
      ),
    );
  }

  Widget _answerButton(int answer) {
    return AnimatedTheme(
      data: ThemeData(outlinedButtonTheme: _buttonStyle(answer)),
      duration: const Duration(milliseconds: 200),
      child: OutlinedButton(
        onPressed: () => onAnswerPressed(answer),
        child: Text(widget.question.answers.elementAt(answer)),
      ),
    );
  }

  OutlinedButtonThemeData? _buttonStyle(int thisAnswer) {
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

  Widget _nextPageButton() {
    return ElevatedButton(
      onPressed: (chosenAnswer == null) ? null : widget.onNextPressed,
      child: const Text('Next'),
    );
  }

  void onAnswerPressed(int answer) {
    setState(() {
      chosenAnswer = answer;
    });
    widget.onQuestionAnswered(widget.question.isCorrect(answer));
  }
}
