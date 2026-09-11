

import 'package:flutter/material.dart';

const Color _customColor= Color.fromARGB(255, 109, 34, 32);
const Color _lightTestColor = Color.fromARGB(255, 255, 245, 157);

const List<Color> _colorTheme =[
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  // Color claro para comprobar que el texto de la burbuja cambie a negro.
  _lightTestColor,
];

class CustomAppTheme{
  final int selectedColor;

  CustomAppTheme({ this.selectedColor=0})
  :assert(selectedColor >= 0 && selectedColor < _colorTheme.length, 'selectedColor is out of bounds, must be between 0 and ${_colorTheme.length - 1}');

  ThemeData theme(){
    final selectedThemeColor = _colorTheme[selectedColor];

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: selectedThemeColor,
      ).copyWith(
        // Conserva el color seleccionado como primary sin que Material 3 lo
        // oscurezca al generar el resto de la paleta.
        primary: selectedThemeColor,
      ),
    );
  }
}
