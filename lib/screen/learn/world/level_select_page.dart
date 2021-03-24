import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../component/fixed_height_cover_box.dart';
import '../../../component/level_header.dart';
import '../../../model/level/level.dart';
import '../../../routes/router_bloc.dart';
import '../../../routes/router_event.dart';

/// Pages in level select screen.
class LevelSelectPage extends StatelessWidget {
  /// Level to display.
  final Level level;

  /// Pages in level select screen.
  const LevelSelectPage({required this.level});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Column(
            children: [
              LevelHeader(
                icon: level.icon,
                title: level.title,
                subtitle: level.subtitle,
              ),
              FixedHeightCoverBox(
                child: level.icon,
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: level.subtitle,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text('Open'),
                    onPressed: () => BlocProvider.of<RouterBloc>(context).add(
                      RouterEventLevelSelected(level: level),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
