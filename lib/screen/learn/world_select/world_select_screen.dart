import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/world.dart';
import '../../../routes/bloc/router_bloc.dart';
import '../../../routes/bloc/router_event.dart';
import 'components/sliding_card.dart';
import 'components/world_card_contents.dart';

/// Screen for world select.
class WorldSelectScreen extends StatefulWidget {
  /// Worlds to display.
  final List<World> worlds;

  /// Screen for world select.
  const WorldSelectScreen({required this.worlds});

  @override
  _WorldSelectScreenState createState() => _WorldSelectScreenState();
}

class _WorldSelectScreenState extends State<WorldSelectScreen> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: widget.worlds
            .map((world) => SlidingCard(
                  imagePath: world.imagePath,
                  child: WorldCardContents(
                    title: world.title,
                    subtitle: world.subtitle,
                    onPressed: () => BlocProvider.of<RouterBloc>(context)
                        .add(RouterEventWorldSelected(world: world)),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
