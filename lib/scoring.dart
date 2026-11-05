import 'package:flutter/material.dart';

class Scoring extends StatelessWidget {
  final String level;
  final double x;
  final int score;
  final ValueChanged<int> onScoreChanged;

  const Scoring({
    super.key,
    required this.level,
    required this.x,
    required this.score,
    required this.onScoreChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 50),
        Column(
          children: [
            SizedBox(width: x, child: Text('     $level')),
            Row(
              children: [
                IconButton(
                  onPressed: () => onScoreChanged(score + 1),
                  icon: const Icon(Icons.plus_one),
                ),
                IconButton(
                  onPressed: () => onScoreChanged(score - 1),
                  icon: const Icon(Icons.exposure_minus_1),
                ),
              ],
            ),
            Text('$score', textAlign: TextAlign.left),
          ],
        ),
        const SizedBox(width: 75),
      ],
    );
  }
}
