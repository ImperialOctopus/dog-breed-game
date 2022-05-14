import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/practice/practice_settings.dart';
import '../../router/bloc/router_bloc.dart';
import '../../router/bloc/router_event.dart';

/// Screen to set up a practice quiz.
class QuizSettingsScreen extends StatelessWidget {
  /// Screen to set up a practice quiz.
  const QuizSettingsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => BlocProvider.of<RouterBloc>(context)
                .add(RouterEventPracticeQuiz(settings: PracticeSettings())),
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
