import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene los colores del tema actual para que la burbuja se adapte
    // automáticamente al esquema visual configurado en la aplicación.
    final colors = Theme.of(context).colorScheme;

    // Si el fondo de la burbuja es claro, usa texto negro para conservar el
    // contraste. Si el fondo es oscuro, mantiene el texto blanco.
    final messageTextColor = colors.primary.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

    // Column acomoda sus hijos de arriba hacia abajo:
    // primero muestra la burbuja y luego agrega un espacio inferior.
    return Column(
      // En un Column, el eje principal es vertical y el eje transversal es
      // horizontal. "end" lleva sus hijos al extremo derecho disponible.
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Container define la apariencia exterior de la burbuja.
        Container(
          decoration: BoxDecoration(
            // Usa el color principal del tema como fondo del mensaje propio.
            color: colors.primary,
            // Redondea las cuatro esquinas para darle forma de burbuja.
            borderRadius: BorderRadius.circular(20),
          ),
          // Padding crea espacio dentro de la burbuja, entre sus bordes
          // decorados y el texto.
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // Text es el contenido más interno de esta rama de widgets.
            child: Text(
              "lorem ipsum",
              style: TextStyle(color: messageTextColor),
            ),
          ),
        ),
        // Separa esta burbuja del siguiente elemento del chat.
        const SizedBox(height: 10),
      ],
    );
  }
}
