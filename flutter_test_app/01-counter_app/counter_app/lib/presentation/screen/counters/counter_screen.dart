

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
        body:Center(
          child: Column( // column hace que el Scaffold no sea constante debido a que cambia debido al tamaño de los dispositivos, por lo que no se puede usar const
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text('$clickCounter', style: const TextStyle(fontSize: 160,
              fontWeight: FontWeight.w100),),
              Text('Clicks',style: TextStyle(fontSize: 25)),
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() { // setState es un metodo que se llama para notificar a Flutter que el estado del widget ha cambiado y que necesita reconstruirse. Esto es necesario para que la interfaz de usuario refleje los cambios en el estado.
              clickCounter++;
            });
          },
          child: const Icon(Icons.plus_one),
        ),
      );
  }
}