import 'package:flutter/material.dart';

/// Info bar for dog size and rarity.
class DogInfoBar extends StatelessWidget {
  /// Dog size. Null if unknown.
  final String? size;

  /// Dog rarity. Null if unknown.
  final String? rarity;

  /// Info bar for dog size and rarity.
  const DogInfoBar({required this.size, required this.rarity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              const Padding(
                  padding: EdgeInsets.all(5), child: Icon(Icons.rule)),
              Text(size ?? '???'),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              const Padding(
                  padding: EdgeInsets.all(5), child: Icon(Icons.people)),
              Text(rarity ?? '???'),
            ],
          )),
        ],
      ),
    );
  }
}
