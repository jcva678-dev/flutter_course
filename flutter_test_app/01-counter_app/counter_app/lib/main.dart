

import 'package:counter_app/presentation/screen/counters/counter_functions_screens.dart';
//import 'package:counter_app/presentation/screen/counters/counter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){

    return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.red,
     ),
      home: CounterFunctionsScreen(),
    );
  }
}