import 'package:flutter/material.dart';

import '../../../model/level/lesson.dart';

/// Level 2 - Uncommon breeds
final level_02 = Lesson(
  label: '02_uncommon_breeds',
  title: 'Level 2',
  subtitle: 'Uncommon Breeds',
  imagePath: 'assets/sample/box.jpg',
  content: _content,
);

final _content = <List<Widget>>[
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
