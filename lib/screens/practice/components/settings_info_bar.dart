import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/question_difficulty.dart';

/// Information bar for the settings for a quiz.
class SettingsInfoBar extends StatelessWidget {
  /// Question difficulty.
  final QuestionDifficulty difficulty;

  /// Number of lives allowed for question.
  final int? lives;

  /// Number of mistakes made in quiz.
  final int mistakes;

  /// Whether time was enabled for the quiz.
  final bool timeEnabled;

  /// Information bar for the settings for a quiz.
  const SettingsInfoBar(
      {required this.difficulty,
      required this.lives,
      required this.mistakes,
      required this.timeEnabled});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: (timeEnabled)
                  ? Column(
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.timer_outlined)),
                      ],
                    )
                  : Column(
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.timer_off_outlined)),
                      ],
                    ),
            ),
            Expanded(
                child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.all(5),
                    child: FaIcon(FontAwesomeIcons.temperatureHigh)),
                Text(difficulty.toString()),
              ],
            )),
            Expanded(
              child: (lives == null)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(5),
                            child: FaIcon(FontAwesomeIcons.heartCircleXmark)),
                        Text('$mistakes'),
                      ],
                    )
                  : Column(
                      children: [
                        (mistakes < lives!)
                            ? const Padding(
                                padding: EdgeInsets.all(5),
                                child: FaIcon(FontAwesomeIcons.heart),
                              )
                            : const Padding(
                                padding: EdgeInsets.all(5),
                                child: FaIcon(FontAwesomeIcons.heartCrack)),
                        Text('${lives! - mistakes} / $lives'),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
