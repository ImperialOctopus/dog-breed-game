import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router/actions/router_pop.dart';
import 'router/router_bloc.dart';
import 'theme/theme.dart';

/// Main app that provides blocs.
class DogBreedGame extends StatefulWidget {
  /// Const constructor.
  const DogBreedGame();

  @override
  _DogBreedGameState createState() => _DogBreedGameState();
}

class _DogBreedGameState extends State<DogBreedGame> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RouterBloc>(
      create: ((context) => RouterBloc()),
      child: MaterialApp(
        title: 'Dog Breed Game',
        theme: themeData,
        home: const _AppView(),
      ),
    );
  }
}

class _AppView extends StatefulWidget {
  const _AppView();

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<_AppView> {
  var _pages = <Page>[];

  _AppViewState();

  @override
  void initState() {
    super.initState();
    final _routerBloc = BlocProvider.of<RouterBloc>(context);
    updatePages(_routerBloc.state.buildRouteStack);
    _routerBloc.listen((state) => updatePages(state.buildRouteStack));
  }

  void updatePages(List<Page<dynamic>> pages) => setState(() {
        _pages = pages;
      });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: _pages,
      onPopPage: (route, dynamic result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by sending pop to the bloc.
        BlocProvider.of<RouterBloc>(context).add(const RouterPop());
        return true;
      },
    );
  }
}
