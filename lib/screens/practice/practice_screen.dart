import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/practice/practice_settings.dart';
import '../../router/actions/router_start_practice.dart';
import '../../router/router_bloc.dart';

/// Screen to set up a practice quiz.
class PracticeScreen extends StatelessWidget {
  /// Screen to set up a practice quiz.
  const PracticeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => BlocProvider.of<RouterBloc>(context)
                .add(RouterStartPractice(settings: PracticeSettings())),
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
