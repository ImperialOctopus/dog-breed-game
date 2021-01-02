import 'package:flutter/material.dart';

/// Screen to select a level in learn mode.
class LevelSelectScreen extends StatefulWidget {
  /// Const constructor
  const LevelSelectScreen();

  @override
  _LevelSelectScreenState createState() => _LevelSelectScreenState();
}

class _LevelSelectScreenState extends State<LevelSelectScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: const [
              Center(
                child: Text('Page 1'),
              ),
              Center(
                child: Text('Page 2'),
              ),
              Center(
                child: Text('Page 3'),
              ),
            ],
          ),
          Stack(),
        ],
      ),
    );
  }
}
