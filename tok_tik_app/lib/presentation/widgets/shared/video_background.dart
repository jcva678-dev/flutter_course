import 'package:flutter/material.dart';

// Overlay decorativo que cubre el video y dibuja un gradiente vertical.
// Se usa como hijo de un Stack porque internamente contiene Positioned.fill.
class VideoBackground extends StatelessWidget {

  // Paleta configurable. build todavía usa colores fijos en el LinearGradient;
  // por eso este parámetro no tiene efecto hasta que se pase allí `colors`.
  final List<Color> colors;

  // Posición de cada color a lo largo del gradiente: valores entre 0.0 y 1.0.
  final List<double> stops;
  
  const VideoBackground({super.key, this.colors= const [
    Colors.transparent,
    Colors.black,
  ], this.stops= const [
    0.0,
    1.0,
  ]}):assert(
    // Cada stop corresponde al color situado en el mismo índice.
    colors.length == stops.length,
    'Colors and stops must have the same length',
  );

  @override
  Widget build(BuildContext context) {
    // Positioned.fill hace que la decoración ocupe todo el Stack contenedor.
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // El gradiente recorre el área desde arriba hacia abajo. Por
            // ejemplo, [0.8, 1.0] concentra la transición al final del video.
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
            ],
          ),
        ),
      ),
    );
  }
}
