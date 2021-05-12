import 'package:flutter/material.dart';

/// Splash screen.
class SplashScreen extends StatelessWidget {
  /// Splash screen.
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Text('Loading saved data...')
          ],
        ),
      ),
    );
  }
}
