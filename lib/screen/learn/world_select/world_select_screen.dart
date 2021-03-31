import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/page_indicator.dart';
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

  late int activePage;

  @override
  void initState() {
    super.initState();
    activePage = 0;
    pageController =
        PageController(viewportFraction: 0.8, initialPage: activePage);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) => setState(() => activePage = index),
                children: widget.worlds
                    .map((world) => SlidingCard(
                          image: Image.asset(
                            world.imagePath,
                            fit: BoxFit.cover,
                          ),
                          heroTag: world,
                          child: WorldCardContents(
                            title: world.title,
                            subtitle: world.subtitle,
                            onPressed: () =>
                                BlocProvider.of<RouterBloc>(context).add(
                                    RouterEventWorldSelected(world: world)),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < widget.worlds.length; i++)
                    PageIndicator(i == activePage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
