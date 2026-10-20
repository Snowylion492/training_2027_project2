import 'package:flutter/material.dart';
import 'classhouse.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// What you need to collect:
// Team number (int)
// Match number (int)
// Scoring coral in the trough (L1), L2, L3, and L4. (int)
// Scoring algae in the net (int)
// Processing algae (int)
final name =Provider<String>((ref){
  return 'Reefscape Scouting App';
});
class AppTitle extends ConsumerWidget {
const AppTitle(Provider<String> name, {super.key});
@override
Widget build(BuildContext context, WidgetRef ref){
final title = ref.watch(name);
  return Text(title);
}
}

void main() {
  runApp(
    ProviderScope(
        child: MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.black), // Theme
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Reefscape Scouting App')),
        body:
Center(child: Reefscape()
        ),
      ),
  )
    ));
}