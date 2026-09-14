import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene los colores del tema activo. Así el borde del campo se adapta
    // automáticamente cuando la aplicación cambie de paleta o de modo.
    final colorScheme = Theme.of(context).colorScheme;

    // Define una sola configuración de borde para reutilizarla en los dos
    // estados del campo: cuando está inactivo y cuando recibe el foco.
    final outlineInputBorder = OutlineInputBorder(
      // Redondea las esquinas del área donde se escribe el mensaje.
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        // Usa el color principal del tema para que el borde sea consistente
        // con el resto de componentes de la aplicación.
        color: colorScheme.primary,
      ),
    );

    // InputDecoration reúne la configuración visual de TextFormField; no se
    // dibuja por sí sola, sino que se entrega al campo más abajo.
    final inputDecoration =InputDecoration(
        // Borde visible mientras el campo está habilitado pero sin selección.
        enabledBorder: outlineInputBorder,
        // Borde visible cuando el usuario toca el campo y escribe en él.
        focusedBorder: outlineInputBorder,
        // Indica que el campo debe dibujar un fondo según el tema actual.
        filled: true,
        // Icono interactivo situado al final (lado derecho) del campo.
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          // Aquí irá la lógica que toma el texto actual y lo agrega al chat.
          onPressed: () {
            // Acción al presionar el botón de enviar
          },
        ));


    // TextFormField muestra el campo de texto y permite integrarlo después
    // con un Form para validación. Su apariencia viene de inputDecoration.
    return TextFormField(
      decoration: inputDecoration ,
      // Se ejecuta al confirmar desde el teclado, por ejemplo pulsando Enter
      // o el botón de enviar que muestra el teclado del teléfono.
      onFieldSubmitted: (value) {
        // Acción al enviar el mensaje
        print('Mensaje enviado: $value');
      },
      // Se ejecuta cada vez que cambia el contenido: value contiene el texto
      // completo que el usuario lleva escrito en ese instante.
      onChanged: (value) {
        // Acción al cambiar el contenido del campo de texto
        print('Contenido del campo de texto: $value');
      },
    );
  }
}
