import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/practice/practice_settings.dart';
import '../../model/question_difficulty.dart';
import '../../router/actions/router_start_practice.dart';
import '../../router/router_bloc.dart';

/// Screen to set up a practice quiz.
class PracticeScreen extends StatefulWidget {
  /// Screen to set up a practice quiz.
  const PracticeScreen();

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  static const _questionNumberText = <int?, String>{
    0: 'Endless',
    25: '25 Questions',
    15: '15 Questions',
    5: '5 Questions',
  };

  static const _livesText = <int?, String>{
    0: 'Unlimited',
    5: '5 Lives',
    3: '3 Lives',
    1: 'No Mistakes',
  };

  static const _difficultyText = <int?, String>{
    0: 'Common Breeds Only (1)',
    1: 'Uncommon Breeds (2)',
    2: 'Rare Breeds (3)',
    3: 'All Breeds (4)'
  };

  PracticeSettings settings = const PracticeSettings(
    questionNumber: null,
    lives: null,
    time: false,
    difficulty: QuestionDifficulty.beginner,
  );

  void _updateQuestionNumber(int? value) {
    if (value == null) {
      return;
    }
    if (value == 0) {
      value = null;
    }
    setState(() {
      settings = PracticeSettings(
        questionNumber: value,
        lives: settings.lives,
        time: settings.time,
        difficulty: settings.difficulty,
      );
    });
  }

  void _updateLives(int? value) {
    setState(() {
      settings = PracticeSettings(
        questionNumber: settings.questionNumber,
        lives: value,
        time: settings.time,
        difficulty: settings.difficulty,
      );
    });
  }

  void _updateTime(bool? value) {
    setState(() {
      settings = PracticeSettings(
        questionNumber: settings.questionNumber,
        lives: settings.lives,
        time: value,
        difficulty: settings.difficulty,
      );
    });
  }

  void _updateDifficulty(QuestionDifficulty? value) {
    setState(() {
      settings = PracticeSettings(
        questionNumber: settings.questionNumber,
        lives: settings.lives,
        time: settings.time,
        difficulty: value,
      );
    });
  }

  Widget _buildModal({required List<Widget> children}) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: children,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Questions'),
                    subtitle: Text(
                        _questionNumberText[settings.questionNumber] ?? ''),
                    onTap: () => showModalBottomSheet<int?>(
                      context: context,
                      builder: (BuildContext context) => _buildModal(children: [
                        ListTile(
                          title: const Text('Endless'),
                          onTap: () => Navigator.pop<int?>(context, 0),
                        ),
                        ListTile(
                          title: const Text('Long (25)'),
                          onTap: () => Navigator.pop<int?>(context, 25),
                        ),
                        ListTile(
                          title: const Text('Normal (15)'),
                          onTap: () => Navigator.pop<int?>(context, 15),
                        ),
                        ListTile(
                          title: const Text('Quick (5)'),
                          onTap: () => Navigator.pop<int?>(context, 5),
                        ),
                        ListTile(
                          title: const Text('Cancel',
                              style: TextStyle(color: Colors.red)),
                          onTap: () => Navigator.pop<int?>(context, null),
                        ),
                      ]),
                    ).then(_updateQuestionNumber),
                  ),
                  ListTile(
                    title: const Text('Mistakes Allowed'),
                    subtitle: Text(_livesText[settings.lives] ?? ''),
                    onTap: () => showModalBottomSheet<int?>(
                      context: context,
                      builder: (BuildContext context) => _buildModal(children: [
                        ListTile(
                          title: const Text('Unlimited'),
                          onTap: () => Navigator.pop<int?>(context, 0),
                        ),
                        ListTile(
                          title: const Text('Normal (5 Lives)'),
                          onTap: () => Navigator.pop<int?>(context, 5),
                        ),
                        ListTile(
                          title: const Text('Challenge (3 Lives)'),
                          onTap: () => Navigator.pop<int?>(context, 3),
                        ),
                        ListTile(
                          title: const Text('No Mistakes (1 Life)'),
                          onTap: () => Navigator.pop<int?>(context, 1),
                        ),
                        ListTile(
                          title: const Text('Cancel',
                              style: TextStyle(color: Colors.red)),
                          onTap: () => Navigator.pop<int?>(context, null),
                        ),
                      ]),
                    ).then(_updateLives),
                  ),
                  ListTile(
                    title: const Text('Difficulty'),
                    subtitle: Text(_difficultyText[settings.difficulty] ?? ''),
                    onTap: () => showModalBottomSheet<QuestionDifficulty?>(
                      context: context,
                      builder: (BuildContext context) => _buildModal(children: [
                        ListTile(
                          title: const Text('Beginner (Common Breeds Only)'),
                          onTap: () => Navigator.pop<QuestionDifficulty?>(
                              context, QuestionDifficulty.beginner),
                        ),
                        ListTile(
                          title:
                              const Text('Intermediate (Some Uncommon Breeds)'),
                          onTap: () => Navigator.pop<QuestionDifficulty?>(
                              context, QuestionDifficulty.intermediate),
                        ),
                        ListTile(
                          title: const Text('Expert (Some Rare Breeds)'),
                          onTap: () => Navigator.pop<QuestionDifficulty?>(
                              context, QuestionDifficulty.expert),
                        ),
                        ListTile(
                          title: const Text('Challenge (All Breeds)'),
                          onTap: () => Navigator.pop<QuestionDifficulty?>(
                              context, QuestionDifficulty.challenge),
                        ),
                        ListTile(
                          title: const Text('Cancel',
                              style: TextStyle(color: Colors.red)),
                          onTap: () =>
                              Navigator.pop<QuestionDifficulty?>(context, null),
                        ),
                      ]),
                    ).then<void>(_updateDifficulty),
                  ),
                  SwitchListTile(
                    title: const Text('Time Limit'),
                    value: settings.time,
                    onChanged: _updateTime,
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => BlocProvider.of<RouterBloc>(context)
                    .add(RouterStartPractice(settings: settings)),
                child: const Text('Start Practice!'),
              ),
            ),
            Container(height: 16),
          ],
        ),
      ),
    );
  }
}
