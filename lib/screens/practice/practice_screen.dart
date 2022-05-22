import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/practice/practice_settings.dart';
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
  static const _defaultSettings =
      PracticeSettings(questionNumber: 0, lives: 0, time: false, difficulty: 0);

  static const _questionNumberText = <int?, String>{};

  static const _livesText = <int?, String>{};

  static const _difficultyText = <int?, String>{
    0: '',
  };

  PracticeSettings settings = _defaultSettings;

  void _updateQuestionNumber(int? value) {
    if (value == null) {
      return;
    }
    setState(() {
      settings = settings.copyWith(questionNumber: value);
    });
  }

  void _updateLives(int? value) {
    if (value == null) {
      return;
    }
    setState(() {
      settings = settings.copyWith(lives: value);
    });
  }

  void _updateTime(bool? value) {
    if (value == null) {
      return;
    }
    setState(() {
      settings = settings.copyWith(time: value);
    });
  }

  void _updateDifficulty(int? value) {
    if (value == null) {
      return;
    }
    setState(() {
      settings = settings.copyWith(difficulty: value);
    });
  }

  Widget _buildModal({Widget? title, required Map<int?, String> listMap}) =>
      Container(
        height: 200,
        color: Colors.amber,
        child: Center(
          child: ListView(
            children: <Widget>[
              if (title != null) title,
              ...listMap.entries.map<Widget>(
                (mapEntry) => ListTile(
                  title: Text(mapEntry.value),
                  onTap: () => Navigator.pop<int?>(context, mapEntry.key),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Practice Quiz'),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Questions'),
                  subtitle:
                      Text(_questionNumberText[settings.questionNumber] ?? ''),
                  onTap: () => showModalBottomSheet<int?>(
                    context: context,
                    builder: (BuildContext context) => _buildModal(
                        title: const Text('Number of Questions'),
                        listMap: _questionNumberText),
                  ).then(_updateQuestionNumber),
                ),
                ListTile(
                  title: const Text('Lives'),
                  subtitle: Text(settings.questionNumber == 0
                      ? 'Unlimited'
                      : settings.questionNumber.toString()),
                  onTap: () => showModalBottomSheet<int?>(
                    context: context,
                    builder: (BuildContext context) => _buildModal(
                        title: const Text('Lives'),
                        listMap: _questionNumberText),
                  ).then(_updateQuestionNumber),
                ),
                SwitchListTile(
                  title: const Text('Time Limit'),
                  value: settings.time,
                  onChanged: _updateTime,
                ),
                ListTile(
                  title: const Text('Difficulty'),
                  subtitle: Text(settings.difficulty.toString()),
                  onTap: () => showModalBottomSheet<int?>(
                    context: context,
                    builder: (BuildContext context) => _buildModal(
                        title: const Text('Difficulty'),
                        listMap: _difficultyText),
                  ).then(_updateDifficulty),
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => BlocProvider.of<RouterBloc>(context)
                  .add(RouterStartPractice(settings: settings)),
              child: const Text('Start'),
            ),
          ),
        ],
      ),
    );
  }
}
