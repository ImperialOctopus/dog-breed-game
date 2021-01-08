import 'package:flutter/material.dart';

import '../../../theme/answer_button_theme.dart';

/// Page to display a single question.
class QuestionPage extends StatelessWidget {
  /// Path to image of dog.
  final String imagePath;

  /// Text to display next to size icon.
  final String size;

  /// Text to display next to rarity icon.

  final String rarity;

  /// List of options for answer buttons.
  final List<String> answers;

  /// Progress to show on bar at the bottom.
  final double progress;

  /// Callback when answer button is pressed.
  final Function(int) onAnswerPressed;

  /// Correct answer.
  final int correctAnswer;

  /// Answer the player chose.
  final int? chosenAnswer;

  /// Const constructor.
  const QuestionPage({
    required this.imagePath,
    required this.size,
    required this.rarity,
    required this.answers,
    required this.progress,
    required this.onAnswerPressed,
    required this.correctAnswer,
    this.chosenAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: AnimatedSwitcher(
              child: Image.asset(
                imagePath,
                key: ValueKey<String>(imagePath),
                fit: BoxFit.cover,
                height: 300,
              ),
              duration: const Duration(milliseconds: 300),
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
            ),
          ),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: progress),
          duration: const Duration(milliseconds: 100),
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
                  Text(size),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.all(5), child: Icon(Icons.people)),
                  Text(rarity),
                ],
              )),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                Center(child: _nextPageButton()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _answerButton(int answer) {
    return AnimatedTheme(
      child: OutlinedButton(
        child: Text(answers[answer]),
        onPressed: () => onAnswerPressed(answer),
      ),
      data: ThemeData(outlinedButtonTheme: _buttonStyle(answer)),
      duration: const Duration(milliseconds: 200),
    );
  }

  OutlinedButtonThemeData? _buttonStyle(int thisAnswer) {
    if (chosenAnswer != null) {
      if (thisAnswer == correctAnswer) {
        return answerCorrectStyle;
      }
      if (thisAnswer == chosenAnswer) {
        return answerIncorrectStyle;
      }
    }
    return answerDefaultStyle;
  }

  Widget _nextPageButton() {
    if (chosenAnswer == null) {
      return const ElevatedButton(onPressed: null, child: Text('Next'));
    } else {
      return ElevatedButton(onPressed: () {}, child: const Text('Next'));
    }
  }
}
