import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes/bloc/router_bloc.dart';
import 'routes/bloc/router_event.dart';
import 'routes/bloc/router_state.dart';
import 'routes/routes.dart';
import 'theme/theme.dart';

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
        theme: themeData,
        home: BlocBuilder<RouterBloc, RouterState>(
            builder: (context, routerState) {
          return Navigator(
            pages: buildRoutes(routerState),
            onPopPage: (route, dynamic result) {
              if (!route.didPop(result)) {
                return false;
              }

              // Update the list of pages by sending pop to the bloc.
              BlocProvider.of<RouterBloc>(context).add(const RouterEventPop());

              return true;
            },
          );
        }),
      ),
    );
  }
}
