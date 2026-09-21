import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class MessageFieldBox extends StatelessWidget {

  // ValueChanged<String> describe un callback que recibe el texto enviado.
  // Este widget solo captura el texto; su padre decide qué hacer con él.
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    // NOTA DE CICLO DE VIDA:
    // Para este ejercicio están creados dentro de build(), pero en un widget
    // real conviene conservar el TextEditingController y el FocusNode en el
    // State de un StatefulWidget y liberarlos posteriormente con dispose().

    // Permite leer y modificar desde Dart el contenido del TextFormField.
    // Es importante conectarlo al campo mediante `controller: textController`;
    // de lo contrario, el campo usaría su propio controlador interno y este
    // objeto no tendría acceso al texto escrito por el usuario.
    final textController= TextEditingController();

    // Representa el foco del campo: indica si este es el elemento que está
    // recibiendo la entrada del teclado. Nos permite quitar el foco para
    // ocultar el teclado o solicitarlo para continuar escribiendo.
    final focusNode = FocusNode();
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
        hintText:'End your message with a "?"',
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
            // onPressed no recibe el texto como parámetro, porque pertenece al
            // botón y no al TextFormField. Por eso se consulta el controlador.
            // `textController.text` sería una forma equivalente y más breve.
            final message = textController.value.text;

            // Delega la acción al padre. El mismo callback se usa abajo al
            // pulsar "Done", para que ambos modos sigan el mismo flujo.
            onValue(message);

            // Como el controlador está conectado al campo, clear() actualiza
            // tanto su valor interno como el texto que se ve en la pantalla.
            textController.clear(); // Limpia el contenido del campo de texto
            // Acción al presionar el botón de enviar
          },
        ));


    // TextFormField muestra el campo de texto y permite integrarlo después
    // con un Form para validación. Su apariencia viene de inputDecoration.
    return TextFormField(
      // Flutter llama a este callback cuando el usuario toca fuera del campo.
      onTapOutside: (event) {
        // Al quitar el foco, normalmente también se oculta el teclado móvil.
        focusNode.unfocus();
      },

      // Conecta el campo con el objeto que administra su foco.
      focusNode: focusNode,

      // Conecta el texto visible del campo con el controlador creado arriba.
      controller: textController,
      decoration: inputDecoration ,
      // Se ejecuta al confirmar desde el teclado, por ejemplo pulsando Enter
      // o el botón de enviar que muestra el teclado del teléfono.
      onFieldSubmitted: (value) {
        // A diferencia de onPressed, este callback pertenece al campo y
        // Flutter entrega directamente el texto enviado en `value`.
        // En este instante, normalmente se cumple:
        // value == textController.text
        // value ya es el String del campo en el instante de confirmar.
        onValue(value);

        textController.clear(); // Limpia el contenido del campo de texto

        // Después de enviar, devuelve el foco al campo para que el usuario
        // pueda escribir otro mensaje sin tener que tocarlo nuevamente.
        focusNode.requestFocus();
      },
    );
  }
}
