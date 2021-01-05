import 'package:flutter/material.dart';

import '../model/level.dart';
import '../model/level_lesson.dart';

/// Default lesson set
const lessons = [
  Level(
    title: 'Level 1',
    subtitle: 'Common Breeds',
    imagePath: 'assets/sample/labrador.jpg',
    description:
        'First level. Check out some information about the top 5 most common dogs in the UK and then try out the quiz to see how well you can recognise them!',
    lesson: LevelLesson(lessonBody: [
      Text('Less-on-1'),
    ]),
  ),
  Level(
    title: 'Level 2',
    subtitle: 'Uncommon Breeds',
    imagePath: 'assets/sample/box.jpg',
    description:
        'Second level! Now we\'re going to try out some less common breeds. Read through the summary under \'Lesson\', then try the Quiz and see how you do.',
    lesson: LevelLesson(lessonBody: []),
  ),
  Level(
    title: 'Level 3',
    subtitle: 'Filling In Some Gaps',
    imagePath: 'assets/sample/pom.jpg',
    description:
        'This lesson will fill in some gaps left in the previous sets of breeds. Once you feel comfortable try out the Quiz to get a mix of breeds from this set of lessons.',
    lesson: LevelLesson(lessonBody: []),
  ),
];
