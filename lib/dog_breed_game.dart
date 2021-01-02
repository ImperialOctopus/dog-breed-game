import 'package:flutter/material.dart';

import 'screen/learn/level_select/level_select_screen.dart';
import 'screen/menu/menu_screen.dart';
import 'theme/theme.dart';

/// Main app that provides blocs.
class DogBreedGame extends StatelessWidget {
  /// Const constructor.
  const DogBreedGame();

  @override
  Widget build(BuildContext context) {
    return const AppView();
    /*
    return MultiRepositoryProvider(
      providers: [],
      child: MultiBlocProvider(
        providers: [],
        child: const AppView(),
      ),
    );
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
      routes: <String, WidgetBuilder>{
        '/learn/levelselect': (var context) => const LevelSelectScreen(),
      },
    );
  }
}
