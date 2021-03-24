import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes/bloc/router_bloc.dart';
import 'routes/bloc/router_state.dart';
import 'routes/routes.dart';

/// Main app that provides blocs.
class DogBreedGame extends StatefulWidget {
  /// Const constructor.
  const DogBreedGame();

  @override
  _DogBreedGameState createState() => _DogBreedGameState();
}

class _DogBreedGameState extends State<DogBreedGame> {
  late final RouterBloc _routerBloc;

  @override
  void initState() {
    super.initState();

    _routerBloc = RouterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RouterBloc>.value(
      value: _routerBloc,
      child: MaterialApp(
        title: 'Dog Breed Game',
        home: BlocBuilder<RouterBloc, RouterState>(
          builder: (context, routerState) =>
              Navigator(pages: buildRoutes(routerState)),
        ),
      ),
    );
  }
}
