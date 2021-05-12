import 'package:dog_breed_game/bloc/progress/progress_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/splash/splash_bloc.dart';
import 'bloc/splash/splash_event.dart';
import 'bloc/splash/splash_state.dart';
import 'repository/progress/memory_progress_repository.dart';
import 'repository/progress/progress_repository.dart';
import 'routes/bloc/router_bloc.dart';
import 'routes/bloc/router_event.dart';
import 'routes/bloc/router_state.dart';
import 'routes/routes.dart';
import 'screen/splash/splash_screen.dart';
import 'theme/theme.dart';

/// Main app that provides blocs.
class DogBreedGame extends StatefulWidget {
  /// Const constructor.
  const DogBreedGame();

  @override
  _DogBreedGameState createState() => _DogBreedGameState();
}

class _DogBreedGameState extends State<DogBreedGame> {
  late final ProgressRepository _progressRepository;

  late final RouterBloc _routerBloc;
  late final SplashBloc _splashBloc;

  @override
  void initState() {
    super.initState();

    _progressRepository = MemoryProgressRepository();

    _routerBloc = RouterBloc();
    _splashBloc = SplashBloc(progressRepository: _progressRepository)
      ..add(const SplashEventLoad());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _routerBloc),
        BlocProvider.value(value: _splashBloc),
      ],
      child: MaterialApp(
        title: 'Dog Breed Game',
        theme: themeData,
        home: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            if (state is SplashStateLoaded) {
              return BlocProvider<ProgressCubit>(
                create: (context) => ProgressCubit(
                  initial: state.progress,
                  progressRepository: _progressRepository,
                ),
                child: _AppView(),
              );
            } else {
              return const SplashScreen();
            }
          },
        ),
      ),
    );
  }
}

class _AppView extends StatelessWidget {
  final _heroController = HeroController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouterBloc, RouterState>(
        builder: (context, routerState) {
      return Navigator(
        pages: buildRoutes(routerState),
        observers: [_heroController],
        onPopPage: (route, dynamic result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by sending pop to the bloc.
          BlocProvider.of<RouterBloc>(context).add(const RouterEventPop());

          return true;
        },
      );
    });
  }
}
