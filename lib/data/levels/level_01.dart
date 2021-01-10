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
  iconData: Icons.ac_unit,
  imagePath: 'assets/sample/labrador.jpg',
  description:
      'First level. Check out some information about the top 5 most common dogs in the UK and then try out the quiz to see how well you can recognise them!',
  lesson: Lesson(lessonBody: [
    Text('Less-on-1'),
  ]),
  quiz: Quiz(questions: [
    Question(
      imagePath: 'assets/sample/labrador.jpg',
      answers: [
        'Dog',
        'Cat',
        'Labrador',
        'Pug',
      ],
      correctAnswer: 2,
      size: 'Small',
      rarity: 'Unobtainable',
    ),
    Question(
      imagePath: 'assets/sample/box.jpg',
      answers: [
        'Conglomerate',
        'Zebra',
        'Pog',
        'Pug',
      ],
      correctAnswer: 1,
      size: 'Small',
    ),
    Question(
      imagePath: 'assets/sample/kiss.jpg',
      answers: [
        'Doge',
        'Cat',
        'Box',
        'Resplendent Quetzal',
      ],
      correctAnswer: 3,
      size: 'Very Big',
    ),
    Question(
      imagePath: 'assets/sample/look.jpg',
      answers: [
        'SpongeBob',
        'Spongebob',
        'Spong Bobe',
        'Bob-Sponge',
      ],
      correctAnswer: 0,
      size: 'Sponge',
      rarity: 'Bob',
    ),
  ]),
);
