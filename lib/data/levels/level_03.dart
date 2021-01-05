import 'package:flutter/material.dart';

import '../../model/level.dart';
import '../../model/level_lesson.dart';

/// Level 1 - Filling in gaps
const level_03 = Level(
  title: 'Level 3',
  subtitle: 'Filling In Some Gaps',
  imagePath: 'assets/sample/pom.jpg',
  description:
      'This lesson will fill in some gaps left in the previous sets of breeds. Once you feel comfortable try out the Quiz to get a mix of breeds from this set of lessons.',
  lesson: LevelLesson(lessonBody: [
    Text('Filling in Some Gaps'),
  ]),
);
