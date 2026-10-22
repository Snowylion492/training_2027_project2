import 'main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'darkmode.dart';
class Scoring extends StatelessWidget {
  final String level;
  final double x;
  const Scoring({super.key, required this.level, required this.x});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 50),
        Column(

          children: [
            SizedBox(width: x, child: Text('     $level')),

            IconButton(
              onPressed: null, // functionality goes here
              icon: Icon(Icons.plus_one),
            ),
            Text(('insert variable'), textAlign: TextAlign.left)
          ],
        ),
        SizedBox(width: 75),
      ],
    );
  }
}

class Reefscape extends StatelessWidget {
  const Reefscape({super.key});
  @override
  Widget build(BuildContext context) {
    return
    Row(
     children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 800, height: 80, child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Team number',
              ),
            ),
            ),SizedBox(width: 800, height: 80, child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Match number'
              ),
            ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Scoring(level: 'L1', x: 50),
                Scoring(level: 'L2', x: 50),
                Scoring(level: 'L3', x: 50),
                Scoring(level: 'L4', x: 50),
              ],
            ),
            SizedBox(height: 80),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Scoring(level: '      Algae in Processor', x: 200),
                Scoring(level: '        Algae in Barge', x: 200),
              ],
            )
          ],
        ),
      ]
      );
  }
}
