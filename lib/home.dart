import 'package:flutter/material.dart';
import 'classhouse.dart';


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
       ),
       ),
       body: Center(
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             TeamInfo(eventKey: '2026cmptx')
           ],
         ),
       ),
     );
   }
 }