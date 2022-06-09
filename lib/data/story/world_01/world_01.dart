import '../../../model/learn/world.dart';
import 'level_01.dart';
import 'level_02.dart';
import 'level_03.dart';

/// First world!
final world01 = World(
  title: 'Most Common',
  description: '''The most common dogs found in practice in the UK.
You'll probably have seen all of these breeds before but it can't help to make sure!''',
  imagePath: 'assets/sample/box.jpg',
  levels: [
    level_01,
    level_02,
    level_03,
  ],
);
