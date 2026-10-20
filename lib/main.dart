import 'package:flutter/material.dart';
import 'classhouse.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// What you need to collect:
// Team number (int)
// Match number (int)
// Scoring coral in the trough (L1), L2, L3, and L4. (int)
// Scoring algae in the net (int)
// Processing algae (int)

void main() {
  runApp(
    ProviderScope(
        child: MaterialApp(
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
    ));
}