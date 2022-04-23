import 'package:flutter/material.dart';

/// Splash screen.
class SplashScreen extends StatelessWidget {
  /// Message to display.
  final String message;

  /// Splash screen.
  const SplashScreen([this.message = '']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            Text(message),
          ],
        ),
      ),
    );
  }
}
