import 'package:flutter/material.dart';

import '../../../component/page_indicator.dart';
import '../../../data/lessons.dart';
import 'level_select_page.dart';

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
              children: [
                LevelSelectPage(level: lessons[0]),
                const Center(
                  child: Text('Page 2'),
                ),
                const Center(
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
