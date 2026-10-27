import 'package:flutter/material.dart';




class Scoring extends StatefulWidget {
  final String level;
  final double x;
  final int score;

  const Scoring({super.key, required this.level, required this.x, required this.score});
  @override
  State<Scoring> createState(){
  return  ScoringState(level: level, x: x, score: score);
  }
}

class ScoringState extends State<Scoring> {
  final String level;
  final double x;
  int score;
  ScoringState({required this.level, required this.x, required this.score});

  @override

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 50),
        Column(

          children: [
            SizedBox(width: x, child: Text('     $level')),
            Row(
              children: [
            IconButton(
              onPressed: () => setState(() {score++;}),
              icon: Icon(Icons.plus_one),
            ),
                IconButton(
                  onPressed: () => setState(() {score--;}),
                  icon: Icon(Icons.exposure_minus_1),
                ),
    ]
            ),
            Text(('$score'), textAlign: TextAlign.left)
          ],
        ),
        SizedBox(width: 75),
      ],
    );
  }
}
class Reefscape extends StatefulWidget {
  const Reefscape({super.key});
  @override
  State<StatefulWidget> createState() {
    return ReefscapeStateful();
  }
}
class ReefscapeStateful extends State<Reefscape> {
 String realTimeInput = '';
 String otherRealTimeInput = '';
  @override

  Widget build(BuildContext context) {
    return
    Row(
     children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 800, height: 80, child: TextField(onChanged: (number) {
      setState(() {
        // Updates the variable automatically on every single keystroke
        realTimeInput = number;
      });
    },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Team number',
              ),
            ),
            ),SizedBox(width: 800, height: 80, child: TextField(onChanged: (Number) {
    setState(() {
    // Updates the variable automatically on every single keystroke
    otherRealTimeInput = Number;
    });
    },
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
                Scoring(level: 'L1', x: 50, score: 0),
                Scoring(level: 'L2', x: 50, score: 0),
                Scoring(level: 'L3', x: 50, score: 0),
                Scoring(level: 'L4', x: 50, score: 0),
              ],
            ),
            SizedBox(height: 80),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Scoring(level: '      Algae in Processor', x: 200, score: 0),
                Scoring(level: '        Algae in Barge', x: 200, score: 0),
              ],
            ),
            FilledButton(onPressed: () => setState(() {
              String teamNumber = realTimeInput;
              String matchNumber = otherRealTimeInput;
// Just add the saving stuff later Jackson
            }), child: Text('Save data') )
          ],
        ),
      ]
      );
  }
}
