import 'package:dog_breed_game/model/level/lesson.dart';
import 'package:dog_breed_game/model/world.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/progress/progress_cubit.dart';
import '../../../../model/progress/progress_item_score.dart';

/// Button for the end of a lesson.
class LessonCompleteButton extends StatelessWidget {
  /// World the lesson is in.
  final World world;

  /// Lesson to change.
  final Lesson lesson;

  /// Button for the end of a lesson.
  const LessonCompleteButton({required this.world, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<ProgressCubit>(context).updateProgress(
          widget.world.label,
          widget.quiz.label,
          ProgressItemScore(score, quiz.questions.length),
        );
      },
      child: Row(
        children: const [Text('Mark as Complete '), Icon(Icons.check)],
      ),
    );
  }
}
