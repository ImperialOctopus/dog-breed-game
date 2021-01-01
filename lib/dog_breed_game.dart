import 'package:dog_breed_game/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogBreedGame extends StatelessWidget {
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

class AppView extends StatelessWidget {
  const AppView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codenames Offline',
      theme: themeData,
      home: MenuScreen(),
      routes: <String, WidgetBuilder>{
        '/play': (var context) => PlayScreen(),
        '/export': (var context) => ExportScreen(),
        '/import': (var context) => ImportScreen(),
        '/spymaster': (var context) => SpymasterScreen(),
      },
    );
  }
}
