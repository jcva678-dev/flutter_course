import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;
  String clickTexts = 'Clicks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions Screen'),
        //leading: IconButton(icon:Icon(Icons.refresh_rounded), onPressed: (){}), // coloca los iconos de la izquierda del AppBar, en este caso un icono de refresh, y se le asigna una funcion vacia al onPressed para que no haga nada al presionarlo
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          // column hace que el Scaffold no sea constante debido a que cambia debido al tamaño de los dispositivos, por lo que no se puede usar const
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              'Click${clickCounter == 1 ? '' : 's'}',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh_outlined,
            onPressed:(){
              setState(() {
                clickCounter = 0;
              });
            }
            ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.plus_one,
             onPressed:(){
              setState(() {
                clickCounter++;
              });
            }),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed:(){
              setState(() {
                if(clickCounter == 0) return; // si clickCounter es igual a 0, entonces no hace nada, de lo contrario, decrementa clickCounter en 1
                clickCounter--;
              });
            }),
        ],
      ),
        
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      elevation: 5,
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
