import 'package:flutter/material.dart';

import '../../model/lesson.dart';
import '../../model/level.dart';
import '../../model/quiz/question.dart';
import '../../model/quiz/quiz.dart';

/// Level 1 - Common breeds
const level_01 = Level(
  id: 0,
  title: 'Level 1',
  subtitle: 'Common Breeds',
  imagePath: 'assets/sample/labrador.jpg',
  description:
      'First level. Check out some information about the top 5 most common dogs in the UK and then try out the quiz to see how well you can recognise them!',
  lesson: Lesson(lessonBody: [
    Text('Less-on-1'),
  ]),
  quiz: Quiz(questions: [
    Question(
      imagePath: 'assets/sample/labrador.jpg',
      answers: {
        'Dog': false,
        'Cat': false,
        'Labrador': true,
        'Pug': false,
      },
      size: 'Small',
      rarity: 'Rare',
    )
  ]),
);
