import 'main.dart';

import 'package:flutter/material.dart';

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
