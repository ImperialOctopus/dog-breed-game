import 'package:flutter/material.dart';

import '../../../component/page_indicator.dart';
import '../../../data/lessons.dart';
import '../../../model/level.dart';
import 'level_select_page.dart';

/// Screen to select a level in learn mode.
class LevelSelectScreen extends StatefulWidget {
  /// Lessons to display on this screen.
  final List<Level> lessons;

  /// Const constructor
  const LevelSelectScreen({required this.lessons});

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
              children: lessons
                  .map((level) => LevelSelectPage(level: level))
                  .toList(),
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
