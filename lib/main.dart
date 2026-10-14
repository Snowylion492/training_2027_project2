import 'package:flutter/material.dart';

void main() {
  VoidCallback? onPressed;
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.black, brightness: Brightness.dark), // Theme
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Reefscape Scouting')),
        body: Column (
          children: [
            const Text('Scouting Practice'),
            const Text(' '),
            const Text('Team 2046'),
        Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Coral Scored: 0'),
                SizedBox(
                  width: 25,
               height: 25,
               child : FilledButton(onPressed: onPressed,child : Text('+'), style: FilledButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),   padding: EdgeInsets.zero,
                 alignment: Alignment.center,),),

                )
              ],
            ),
            FilledButton.tonal(onPressed: onPressed, child: Text('Submit'))
        ]
        ),
      ),
    ),
  );
}
