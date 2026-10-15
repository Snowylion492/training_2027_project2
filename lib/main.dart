import 'package:flutter/material.dart';
class TeamLabel extends StatelessWidget {
  final String name;

  const TeamLabel({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.group),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, textAlign: TextAlign.left,),
            const SizedBox(width: 8),
            Text('5 matches scouted', textAlign: TextAlign.left,)
          ],
        )
      ],
    );
  }
}
void main() {
  VoidCallback? h;
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.black), // Theme
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Reefscape Scouting')),
        body:
Center(child: TeamLabel(name: 'Bear Metal')
        ),
      ),
  )
  );
}
