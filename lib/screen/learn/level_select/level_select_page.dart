import 'package:flutter/material.dart';

import '../../../model/lesson_level.dart';

/// Pages in level select screen.
class LevelSelectPage extends StatelessWidget {
  /// LessonLevel to display.
  final LessonLevel level;

  /// Level select page.
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

        //child: Image.asset(level.imagePath),

        //child: Image.asset(level.imagePath),
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
              TextButton(child: const Text('Lesson'), onPressed: () {}),
              TextButton(child: const Text('Quiz'), onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
