import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/quiz_data/quiz_data_repository.dart';
import '../learn/level_select/level_select_screen.dart';

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
              Container(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  child: const Text('Learn'),
                  onPressed: () => Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) => LevelSelectScreen(
                          levels:
                              RepositoryProvider.of<QuizDataRepository>(context)
                                  .allLevels),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  child: const Text('Practice'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
