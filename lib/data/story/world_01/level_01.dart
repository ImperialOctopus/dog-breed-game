import '../../../model/learn/knowledge_check.dart';
import '../../../model/quiz/quiz_settings.dart';
import '../../questions/categories.dart';

/// Level 1 - Common breeds
final level_01 = KnowledgeCheck(
  title: 'Level 1',
  subtitle: 'Common Breeds',
  imagePath: 'assets/sample/labrador.jpg',
  quizSettings: QuizSettings(
    categories: [Categories.mostCommonTen],
    lives: 3,
    questionNumber: 5,
  ),
);
