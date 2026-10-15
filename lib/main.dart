import 'package:flutter/material.dart';
import 'classhouse.dart';
// What you need to collect:
// Team number (int)
// Match number (int)
// Scoring coral in the trough (L1), L2, L3, and L4. (int)
// Scoring algae in the net (int)
// Processing algae (int)

class Reefscape extends StatelessWidget {
  const Reefscape({super.key});
  @override
  Widget build(BuildContext context) {
    return
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
        );
  }
}
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.black), // Theme
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Reefscape Scouting')),
        body:
Center(child: Reefscape()
        ),
      ),
  )
  );
}