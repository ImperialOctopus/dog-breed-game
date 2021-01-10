import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/progress/progress_bloc.dart';
import 'bloc/progress/progress_event.dart';
import 'repository/progress/memory_progress_repository.dart';
import 'repository/progress/progress_repository.dart';
import 'repository/quiz_data/local_quiz_data_repository.dart';
import 'repository/quiz_data/quiz_data_repository.dart';
import 'screen/menu/menu_screen.dart';
import 'theme/theme.dart';

/// Main app that provides blocs.
class DogBreedGame extends StatefulWidget {
  /// Const constructor.
  const DogBreedGame();

  @override
  _DogBreedGameState createState() => _DogBreedGameState();
}

class _DogBreedGameState extends State<DogBreedGame> {
  late final QuizDataRepository _quizDataRepository;
  late final ProgressRepository _progressRepository;

  late final ProgressBloc _progressBloc;

  @override
  void initState() {
    super.initState();

    _quizDataRepository = const LocalQuizDataRepository();
    _progressRepository = MemoryProgressRepository();

    _progressBloc = ProgressBloc(
      progressRepository: _progressRepository,
      quizDataRepository: _quizDataRepository,
    )..add(const LoadProgress());
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<QuizDataRepository>.value(
          value: _quizDataRepository,
        ),
        RepositoryProvider<ProgressRepository>.value(
          value: _progressRepository,
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProgressBloc>.value(
            value: _progressBloc,
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

/// Main app view that consumes blocs.
class AppView extends StatelessWidget {
  /// Const constructor.
  const AppView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Breed Game!',
      theme: themeData,
      home: const MenuScreen(),
    );
  }
}
