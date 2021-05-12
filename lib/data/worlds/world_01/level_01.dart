import '../../../model/level/question.dart';
import '../../../model/level/quiz.dart';

/// Level 1 - Common breeds
const level_01 = Quiz(
  id: '01_common_breeds',
  title: 'Level 1',
  subtitle: 'Common Breeds',
  imagePath: 'assets/sample/labrador.jpg',
  questions: [
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
  ],
);
