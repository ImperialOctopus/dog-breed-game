import '../../../model/learn/knowledge_check.dart';
import '../../../model/question_difficulty.dart';
import '../../../model/quiz/quiz_settings.dart';

/// Level 1 - Common breeds
const level_01 = KnowledgeCheck(
    title: 'Level 1',
    subtitle: 'Common Breeds',
    imagePath: 'assets/sample/labrador.jpg',
    quizSettings: QuizSettings(
        difficulty: QuestionDifficulty.beginner,
        lives: 3,
        questionNumber: 5,
        time: false));
