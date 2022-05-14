import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router/actions/router_open_menu_option.dart';
import '../../router/router_bloc.dart';

/// Starting menu screen.
class MenuScreen extends StatelessWidget {
  /// Starting menu screen.
  const MenuScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dog Game',
                style: Theme.of(context).textTheme.headline1,
              ),
              //Container(height: 10),
              Text(
                'Working Title',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Container(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () => BlocProvider.of<RouterBloc>(context).add(
                      const RouterOpenMenuOption(
                          mainMenuOption: MainMenuOption.learn)),
                  child: const Text('Learn'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () => BlocProvider.of<RouterBloc>(context).add(
                      const RouterOpenMenuOption(
                          mainMenuOption: MainMenuOption.practice)),
                  child: const Text('Practice'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
