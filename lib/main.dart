import 'package:flutter/material.dart';


import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gorouter.dart';
// What you need to collect:
// Team number (int)
// Match number (int)
// Scoring coral in the trough (L1), L2, L3, and L4. (int)
// Scoring algae in the net (int)

// Processing algae (int)
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router);
  }
}
final name = Provider<String>((ref) {
  return 'Reefscape Scouting App';
});

class AppTitle extends ConsumerWidget {
  const AppTitle(Provider<String> name, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(name);
    return Text(title);
  }
}

void main() {
  runApp(
    ProviderScope(
        child : const MyApp()
    ),
  );
}
// example time!
// void main() => runApp(const MyApp());
// final GoRouter _router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const HomeScreen();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: 'details',
//           builder: (BuildContext context, GoRouterState state) {
//             return const DetailsScreen();
//           },
//         ),
//       ],
//     ),
//   ],
// );/// The home screen
// class HomeScreen extends StatelessWidget {
//   /// Constructs a [HomeScreen]
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home Screen')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => context.go('/details'),
//           child: const Text('Go to the Details screen'),
//         ),
//       ),
//     );
//   }
// }
//
// /// The details screen
//
