import 'package:flutter/material.dart';

/// Starting menu screen
class MenuScreen extends StatelessWidget {
  /// Const constructor
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
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/learn/levelselect'),
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
