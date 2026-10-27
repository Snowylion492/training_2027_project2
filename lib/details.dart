import 'package:flutter/material.dart';

import 'classhouse.dart';


class DetailsScreen extends StatelessWidget {
   /// Constructs a [DetailsScreen]
   const DetailsScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text('Scouting Screen')),
       body: Row(
         children: [
Reefscape()
     ]
       ),
     );
   }
 }