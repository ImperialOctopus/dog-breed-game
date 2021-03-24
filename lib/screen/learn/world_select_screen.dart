import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/worlds/world_01/world_01.dart';
import '../../model/world.dart';
import '../../routes/bloc/router_bloc.dart';
import '../../routes/bloc/router_event.dart';

/// Screen for world select.
class WorldSelectScreen extends StatelessWidget {
  final List<World> _worlds = [
    world01,
  ];

  /// Screen for world select.
  WorldSelectScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<RouterBloc>(context)
                .add(RouterEventWorldSelected(world: _worlds.first));
          },
          child: const Text('Open'),
        ),
      ),
    );
  }
}
