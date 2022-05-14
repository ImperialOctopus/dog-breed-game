import '../../../model/questions/image_id_question.dart';
import '../../../model/level/knowledge_check.dart';

/// Level 1 - Common breeds
const level_01 = KnowledgeCheck(
  label: '01_01_common_breeds',
  title: 'Level 1',
  subtitle: 'Common Breeds',
  imagePath: 'assets/sample/labrador.jpg',
  questions: [
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
  ],
);
