```dart
void main() {
  // Creamos una instancia de Square.
  // El constructor valida que el lado sea >= 0 mediante assert.
  final mySquare = Square(side: 10);

  // Modificamos el lado utilizando el setter.
  // El setter se encarga de validar que el nuevo valor sea válido.
  mySquare.side = 5;

  // Accedemos al área mediante el getter.
  // Se utiliza como una propiedad: mySquare.area
  print('Área: ${mySquare.area}');
}


// Representa un cuadrado.
// _side es privado y solo debe modificarse mediante los mecanismos
// que la clase proporciona.
class Square {

  // El "_" indica que _side es privado a la librería.
  // Evitamos que código externo pueda modificarlo directamente.
  double _side;


  // Constructor de Square.
  //
  // Antes de asignar el valor a _side, verificamos que el lado
  // sea mayor o igual a 0.
  Square({required double side})
      : assert(
          side >= 0,
          'side must be >= 0',
        ),
        _side = side;


  // Getter:
  //
  // Permite obtener el área como si fuera una propiedad:
  //
  // mySquare.area
  //
  // No necesitamos escribir mySquare.area()
  double get area {
    return _side * _side;
  }


  // Setter:
  //
  // Permite modificar el lado:
  //
  // mySquare.side = 5;
  //
  // Antes de modificar _side, validamos el nuevo valor.
  set side(double value) {

    // Si intentamos establecer un lado negativo,
    // impedimos que el objeto quede en un estado inválido.
    if (value < 0) {
      throw 'Value must be >= 0';
    }

    // Si el valor es válido, actualizamos el atributo privado.
    _side = value;
  }
}
```
