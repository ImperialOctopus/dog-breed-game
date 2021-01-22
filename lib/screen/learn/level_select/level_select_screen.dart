import 'package:flutter/material.dart';

import '../../../component/page_indicator.dart';
import '../../../model/level.dart';
import 'level_select_page.dart';

/// Screen to select a level in learn mode.
class LevelSelectScreen extends StatefulWidget {
  /// Lessons to display on this screen.
  final List<Level> levels;

  /// Screen to select a level in learn mode.
  const LevelSelectScreen({required this.levels});

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
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => activePage = index),
              children: widget.levels
                  .map((level) => LevelSelectPage(level: level))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
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
