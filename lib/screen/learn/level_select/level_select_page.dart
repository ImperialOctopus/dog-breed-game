import 'package:flutter/material.dart';

/// Pages in level select screen.
class LevelSelectPage extends StatelessWidget {
  /// Level select page.
  const LevelSelectPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.text_rotate_up_sharp,
                size: 100,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Level 1',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Padding(padding: EdgeInsets.only(top: 4)),
                Text(
                  'Common Breeds',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: 300,
            color: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text('The top 5 most common breeds in the UK'),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(child: const Text('Lesson'), onPressed: () {}),
              TextButton(child: const Text('Quiz'), onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
