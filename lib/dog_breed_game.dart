import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repository/local_quiz_data_repository.dart';
import 'repository/quiz_data_repository.dart';
import 'screen/menu/menu_screen.dart';
import 'theme/theme.dart';

/// Main app that provides blocs.
class DogBreedGame extends StatelessWidget {
  /// Const constructor.
  const DogBreedGame();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<QuizDataRepository>(
          create: (context) => LocalQuizDataRepository(),
        )
      ],
      child: const AppView(),
    );
    /*
    MultiBlocProvider(
      providers: [],
      child: const AppView(),
    ),
    */
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
