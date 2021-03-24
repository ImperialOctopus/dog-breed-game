import 'package:flutter/material.dart';

import '../../../model/world.dart';
import 'level_01.dart';
import 'level_02.dart';
import 'level_03.dart';

/// First world!
const world01 = World(
  title: Text('Title'),
  imagePath: 'assets/sample/box.jpg',
  levels: [
    level_01,
    level_02,
    level_03,
  ],
);
