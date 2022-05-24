import '../../model/questions/image_id_question.dart';

const sampleQuestions = [
  ImageIdQuestion(
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
  ImageIdQuestion(
    imagePath: 'assets/sample/box.jpg',
    answers: [
      'Conglomerate',
      'Zebra',
      'Pog',
      'Bug',
    ],
    correctAnswer: 1,
    size: 'Small',
  ),
  ImageIdQuestion(
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
  ImageIdQuestion(
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
];
