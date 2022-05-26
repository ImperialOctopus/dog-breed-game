import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/progress/progress_cubit.dart';
import 'bloc/splash/splash_bloc.dart';
import 'bloc/splash/splash_event.dart';
import 'bloc/splash/splash_state.dart';
import 'model/learn_structure.dart';
import 'repository/learn_structure/learn_structure_repository.dart';
import 'repository/learn_structure/local_learn_structure_repository.dart';
import 'repository/progress/memory_progress_repository.dart';
import 'repository/progress/progress_repository.dart';
import 'repository/question/local_question_repository.dart';
import 'repository/question/question_repository.dart';
import 'router/actions/router_pop.dart';
import 'router/router_bloc.dart';
import 'screens/splash/splash_screen.dart';
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
  late final LearnStructureRepository _learnStructureRepository;
  late final QuestionRepository _questionRepository;

  late final RouterBloc _routerBloc;
  late final SplashBloc _splashBloc;

  @override
  void initState() {
    super.initState();

    _progressRepository = MemoryProgressRepository();
    _learnStructureRepository = LocalLearnStructureRepository();
    _questionRepository = LocalQuestionRepository();

    _routerBloc = RouterBloc();
    _splashBloc = SplashBloc(
      progressRepository: _progressRepository,
      learnStructureRepository: _learnStructureRepository,
    )..add(const SplashEventLoad());
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProgressRepository>.value(
            value: _progressRepository),
        RepositoryProvider<QuestionRepository>.value(
            value: _questionRepository),
        RepositoryProvider<LearnStructureRepository>.value(
            value: _learnStructureRepository),
      ],
      child: MultiBlocProvider(
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
                return RepositoryProvider<LearnStructure>.value(
                  value: state.structure,
                  child: BlocProvider<ProgressCubit>(
                    create: (context) => ProgressCubit(
                      initial: state.progress,
                      progressRepository: _progressRepository,
                    ),
                    child: _AppView(routerBloc: _routerBloc),
                  ),
                );
              } else if (state is SplashStateLoading) {
                return SplashScreen(state.loadingMessage ?? '');
              } else {
                return const SplashScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}

class _AppView extends StatefulWidget {
  final RouterBloc routerBloc;

  const _AppView({required this.routerBloc});

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<_AppView> {
  final _heroController = HeroController();

  var _pages = <Page>[];

  _AppViewState();

  @override
  void initState() {
    super.initState();
    updatePages(widget.routerBloc.state.buildRouteStack);
    widget.routerBloc.listen((state) => updatePages(state.buildRouteStack));
  }

  void updatePages(List<Page<dynamic>> pages) => setState(() {
        _pages = pages;
      });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: _pages,
      observers: [_heroController],
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
