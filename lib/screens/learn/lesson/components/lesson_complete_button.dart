import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/learn/lesson.dart';
import '../../../../router/actions/router_pop.dart';
import '../../../../router/router_bloc.dart';

/// Button for the end of a lesson.
class LessonCompleteButton extends StatelessWidget {
  /// Lesson to change.
  final Lesson lesson;

  /// Button for the end of a lesson.
  const LessonCompleteButton({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<RouterBloc>(context).add(const RouterPop());
      },
      child: Center(
        child: Row(
          children: const [Text('Complete '), Icon(Icons.check)],
        ),
      ),
    );
  }
}
