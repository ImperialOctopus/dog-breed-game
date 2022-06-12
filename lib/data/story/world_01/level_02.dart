import 'package:flutter/material.dart';

import '../../../model/learn/lesson.dart';

/// Level 2 - Uncommon breeds
final level_02 = Lesson(
  title: 'Level 2',
  subtitle: 'Uncommon Breeds',
  imagePath: 'assets/sample/box.jpg',
  content: _content,
);

final _content = const <List<Widget>>[
  [
    Text('First page'),
    Text('Welcome'),
  ],
  [
    Text('Second page'),
  ],
  [
    Text('Last page'),
  ],
];
