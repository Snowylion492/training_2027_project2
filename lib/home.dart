import 'package:flutter/material.dart';



import 'package:go_router/go_router.dart';
class HomeScreen extends StatelessWidget {
   /// Constructs a [HomeScreen]
   const HomeScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text('Home Screen'), leading: IconButton(
         onPressed: () => context.go('/details'),
         icon: Icon(Icons.ad_units),
       ),),
     );
   }
 }