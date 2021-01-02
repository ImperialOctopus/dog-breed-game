import 'package:dog_breed_game/component/page_indicator.dart';
import 'package:dog_breed_game/screen/learn/level_select/level_select_page.dart';
import 'package:flutter/material.dart';

/// Screen to select a level in learn mode.
class LevelSelectScreen extends StatefulWidget {
  /// Const constructor
  const LevelSelectScreen();

  @override
  _LevelSelectScreenState createState() => _LevelSelectScreenState();
}

class _LevelSelectScreenState extends State<LevelSelectScreen> {
  late final PageController _pageController;

  late int activePage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    activePage = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => activePage = index),
              children: const [
                LevelSelectPage(),
                Center(
                  child: Text('Page 2'),
                ),
                Center(
                  child: Text('Page 3'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < 3; i++) PageIndicator(i == activePage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
