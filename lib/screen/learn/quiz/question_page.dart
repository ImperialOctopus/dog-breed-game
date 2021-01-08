import 'package:flutter/material.dart';

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

  static final ButtonStyle _answerCorrectStyle = OutlinedButton.styleFrom(
    primary: Colors.black,
    backgroundColor: Colors.green.shade700,
  );
  static final ButtonStyle _answerIncorrectStyle = OutlinedButton.styleFrom(
    primary: Colors.black,
    backgroundColor: const Color.fromARGB(255, 181, 51, 70),
  );

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
        Image.asset(imagePath),
        LinearProgressIndicator(value: progress),
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
    return OutlinedButton(
      style: _buttonStyle(answer),
      child: Text(answers[answer]),
      onPressed: () => onAnswerPressed(answer),
    );
  }

  ButtonStyle? _buttonStyle(int thisAnswer) {
    if (chosenAnswer == null) {
      return null;
    }
    if (thisAnswer == correctAnswer) {
      return _answerCorrectStyle;
    }
    if (thisAnswer == chosenAnswer) {
      return _answerIncorrectStyle;
    }
    return null;
  }

  Widget _nextPageButton() {
    if (chosenAnswer == null) {
      return const ElevatedButton(onPressed: null, child: Text('Next'));
    } else {
      return ElevatedButton(onPressed: () {}, child: const Text('Next'));
    }
  }
}
