import 'package:flutter/material.dart';

import 'classhouse.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'darkmode.dart';
import 'package:go_router/go_router.dart';
import 'main.dart';
import 'gorouter.dart';
class DetailsScreen extends StatelessWidget {
   /// Constructs a [DetailsScreen]
   const DetailsScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text('Details Screen')),
       body: Row(
         children: [
           Column(
             children: [
               IconButton(
           onPressed: () => context.go('/'),
           child: const Text('Go back to the Home screen'),
         ),
     ]
           ),

     ]
       ),
     );
   }
 }