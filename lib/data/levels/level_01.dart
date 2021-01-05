import 'package:flutter/material.dart';

import '../../model/level.dart';
import '../../model/level_lesson.dart';

/// Level 1 - Common breeds
const level_01 = Level(
  title: 'Level 1',
  subtitle: 'Common Breeds',
  imagePath: 'assets/sample/labrador.jpg',
  description:
      'First level. Check out some information about the top 5 most common dogs in the UK and then try out the quiz to see how well you can recognise them!',
  lesson: LevelLesson(lessonBody: [
    Text('Less-on-1'),
  ]),
);
