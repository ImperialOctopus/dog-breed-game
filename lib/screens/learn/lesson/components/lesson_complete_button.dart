import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/progress/progress_cubit.dart';
import '../../../../model/level/lesson.dart';
import '../../../../model/progress/level_complete.dart';
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
        BlocProvider.of<ProgressCubit>(context)
            .updateProgress(lesson, const LevelComplete());
        BlocProvider.of<RouterBloc>(context).add(const RouterPop());
      },
      child: Row(
        children: const [Text('Mark as Complete '), Icon(Icons.check)],
      ),
    );
  }
}
