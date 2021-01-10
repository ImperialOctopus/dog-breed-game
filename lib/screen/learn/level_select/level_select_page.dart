import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/progress/progress_bloc.dart';
import '../../../bloc/progress/progress_state.dart';
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
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.text_rotate_up_sharp,
                size: 100,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  level.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Padding(padding: EdgeInsets.only(top: 4)),
                Text(
                  level.subtitle,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            )
          ],
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
              TextButton(
                child: const Text('Lesson'),
                onPressed: (level.lesson == null)
                    ? null
                    : () => Navigator.of(context).push(
                          MaterialPageRoute<LessonScreen>(
                              builder: (context) =>
                                  LessonScreen(lesson: level.lesson!)),
                        ),
              ),
              TextButton(
                child: BlocBuilder<ProgressBloc, ProgressState>(
                  builder: (context, state) {
                    if (state is ProgressLoaded) {
                      return Column(
                        children: [
                          const Text('Quiz'),
                          Text((state
                                          .getProgressByLevel(level)
                                          .getQuizProgress(0) *
                                      100)
                                  .toStringAsFixed(0) +
                              '%')
                        ],
                      );
                    } else {
                      return const Text('Quiz');
                    }
                  },
                ),
                onPressed: (level.quiz == null)
                    ? null
                    : () => Navigator.of(context).push(
                        MaterialPageRoute<QuizScreen>(
                            builder: (context) =>
                                QuizScreen(quiz: level.quiz!))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
