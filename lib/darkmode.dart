import 'package:flutter/material.dart';
import 'classhouse.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class ThemeToggle extends Notifier<bool> {
  @override
  bool build() => false; // This is the starting value (Dark Mode off)
  void toggle() {
    state = !state;
  } // Flips true to false, or false to true
// Write this out in the open at the top of a file, outside of any class!
}
final themeToggleProvider = NotifierProvider<ThemeToggle, bool>(() {
  return ThemeToggle();
});
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeToggleProvider); // Listens to the true.
    return ElevatedButton(
        onPressed: () {
          ref.read(themeToggleProvider.notifier).toggle();
        },
        child: Text(isDarkMode ? 'Dark Mode: ON' : 'Dark Mode: OFF'));
  }
}
