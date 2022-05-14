import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/practice/practice_settings.dart';
import '../../router/bloc/router_bloc.dart';
import '../../router/bloc/router_event.dart';

/// Screen for the practice quiz.
class PracticeScreen extends StatelessWidget {
  /// Settings for the quiz to play.
  final PracticeSettings settings;

  /// Screen for the practice quiz.
  const PracticeScreen({required this.settings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => BlocProvider.of<RouterBloc>(context)
                .add(RouterEventPracticeQuiz(settings: settings)),
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
