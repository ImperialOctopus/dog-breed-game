import 'package:flutter/material.dart';

import '../../../components/page_indicator.dart';
import '../../../model/learn/lesson.dart';
import 'lesson_page.dart';

/// Screen to show a single lesson.
class LessonScreen extends StatefulWidget {
  /// Lesson to show on this screen.
  final Lesson lesson;

  /// Screen to show a single lesson.
  const LessonScreen({required this.lesson});

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late final PageController pageController;

  late int activePage;

  @override
  void initState() {
    super.initState();
    activePage = 0;
    pageController =
        PageController(viewportFraction: 1, initialPage: activePage);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) => setState(() => activePage = index),
              itemBuilder: (context, index) =>
                  LessonPage(lesson: widget.lesson, index: index),
              itemCount: widget.lesson.content.length,
            ),
          ),
          if (widget.lesson.content.length > 1)
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < widget.lesson.content.length; i++)
                    PageIndicator(i == activePage),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
