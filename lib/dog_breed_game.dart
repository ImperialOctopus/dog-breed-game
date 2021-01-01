import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme/theme.dart';

/// Main app that provides blocs.
class DogBreedGame extends StatelessWidget {
  /// Const constructor.
  const DogBreedGame();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [],
      child: MultiBlocProvider(
        providers: [],
        child: AppView(),
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
      home: Container(),
      routes: <String, WidgetBuilder>{
        '/play': (var context) => Container(),
        '/export': (var context) => Container(),
        '/import': (var context) => Container(),
        '/spymaster': (var context) => Container(),
      },
    );
  }
}
