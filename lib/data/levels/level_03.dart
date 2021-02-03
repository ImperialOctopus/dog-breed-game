import 'package:flutter/material.dart';

import '../../component/level/lesson.dart';
import '../../component/level/level.dart';

/// Level 1 - Filling in gaps
const level_03 = Level(
  id: 2,
  title: 'Level 3',
  subtitle: 'Filling In Some Gaps',
  iconData: Icons.rowing_outlined,
  imagePath: 'assets/sample/pom.jpg',
  description:
      'This lesson will fill in some gaps left in the previous sets of breeds. Once you feel comfortable try out the Quiz to get a mix of breeds from this set of lessons.',
  lesson: Lesson(lessonBody: [
    Text('Filling in Some Gaps'),
  ]),
  quiz: null,
);
