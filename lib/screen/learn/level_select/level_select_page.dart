import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/progress/progress_bloc.dart';
import '../../../bloc/progress/progress_state.dart';
import '../../../component/level_header.dart';
import '../../../model/level.dart';
import '../lesson/lesson_screen.dart';
import '../quiz/quiz_screen.dart';

/// Pages in level select screen.
class LevelSelectPage extends StatelessWidget {
  /// Level to display.
  final Level level;

  /// Pages in level select screen.
  const LevelSelectPage({required this.level});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        LevelHeader(
          iconData: Icons.text_rotate_up,
          title: level.title,
          subtitle: level.subtitle,
        ),
        SizedBox(
          height: 300,
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              level.imagePath,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(level.description),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              if (level.lesson != null)
                TextButton(
                  child: const Text('Lesson'),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<LessonScreen>(
                        builder: (context) =>
                            LessonScreen(lesson: level.lesson!)),
                  ),
                ),
              if (level.quiz != null)
                TextButton(
                  child: BlocBuilder<ProgressBloc, ProgressState>(
                    builder: (context, state) {
                      if (state is ProgressLoaded) {
                        final score = state.getProgressByLevel(level).quizScore;
                        return Column(
                          children: [
                            const Text('Quiz'),
                            if (score != 0)
                              Text((score * 100).toStringAsFixed(0) + '%')
                          ],
                        );
                      } else {
                        return const Text('Quiz');
                      }
                    },
                  ),
                  onPressed: () => Navigator.of(context).push<void>(
                      MaterialPageRoute<QuizScreen>(
                          builder: (context) => QuizScreen(level: level))),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
