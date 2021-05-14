import 'package:flutter/material.dart';

import '../../../../components/fixed_height_cover_box.dart';
import '../../../../model/level/quiz.dart';

/// Header for result screen.
class ResultHeader extends StatelessWidget {
  /// Quiz this is the result for.
  final Quiz quiz;

  /// Header for result screen.
  const ResultHeader({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FixedHeightCoverBox(
          height: 200,
          child: Hero(
            tag: quiz,
            child: Image.asset(quiz.imagePath, fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
