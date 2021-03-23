import 'package:flutter/material.dart';

import '../../../model/world.dart';
import 'level_01.dart';
import 'level_02.dart';
import 'level_03.dart';

final world01 = World(
  title: const Text('Title'),
  iconImage: Image.asset('assets/sample/box.jpg'),
  levels: [
    level_01,
    level_02,
    level_03,
  ],
);
