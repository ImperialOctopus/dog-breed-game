import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/learn/knowledge_check.dart';
import '../../../router/actions/router_start_knowledge_check.dart';
import '../../../router/router_bloc.dart';

/// Introduces end-of-lesson quiz.
class KnowledgeCheckIntroScreen extends StatelessWidget {
  /// Quiz this introduces.
  final KnowledgeCheck knowledgeCheck;

  /// Introduces end-of-lesson quiz.
  const KnowledgeCheckIntroScreen({required this.knowledgeCheck});

  static const double _headerImageHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: _headerImageHeight,
              child: Hero(
                tag: knowledgeCheck,
                child: Image.asset(knowledgeCheck.imagePath, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(knowledgeCheck.title),
                  if (knowledgeCheck.subtitle != null)
                    Text(knowledgeCheck.subtitle!),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<RouterBloc>(context).add(
                        RouterStartKnowledgeCheck(
                            knowledgeCheck: knowledgeCheck));
                  },
                  child: const Text('Start'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
