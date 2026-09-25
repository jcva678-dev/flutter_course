import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // Obtiene los colores del tema actual para que la burbuja se adapte
    // automáticamente al esquema visual configurado en la aplicación.
    final colors = Theme.of(context).colorScheme;

    // Decide el color del texto según la luminosidad del fondo real de esta
    // burbuja: secondary. Así conserva contraste con temas claros u oscuros.
    final messageTextColor = colors.secondary.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

    // Column agrupa todos los elementos de una respuesta y los organiza de
    // arriba hacia abajo: texto, separación, imagen y separación final.
    return Column(
    // En un Column, el eje principal es vertical y el eje transversal es
      // horizontal. "start" coloca los hijos al lado izquierdo: es un mensaje
      // recibido, a diferencia de un mensaje propio alineado a la derecha.
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container dibuja la burbuja de texto: su color, forma y tamaño se
        // adaptan al contenido que contiene dentro.
        Container(
          decoration: BoxDecoration(
            // Usa el color secundario definido por el tema para diferenciar
            // visualmente los mensajes recibidos de los enviados.
            color: colors.secondary,
            // Redondea las esquinas para darle apariencia de burbuja.
            borderRadius: BorderRadius.circular(20),
          ),
          // Padding crea el margen interior: separa el texto de los bordes
          // coloreados del Container sin ocupar espacio fuera de la burbuja.
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // Text es el contenido más interno de esta rama de widgets.
            child: Text(
              message.text,
              style: TextStyle(color: messageTextColor),
            ),
          ),
        ),
        // Deja espacio vertical antes de mostrar la imagen de la respuesta.
        const SizedBox(height: 10),
        // Widget privado encargado únicamente de construir la imagen/GIF.
        // `!` afirma que los mensajes de la API siempre incluyen imageUrl;
        // si más adelante hubiera respuestas sin imagen, aquí habría que
        // comprobar null antes de crear _ImageBubble.
        _ImageBubble(imageUrl: message.imageUrl!,),
        // Deja una separación antes del siguiente mensaje del ListView.
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // MediaQuery obtiene información del espacio disponible en la pantalla.
    // "size" contiene el ancho y alto lógicos de la ventana actual.
    final size = MediaQuery.of(context).size;

    // ClipRRect recorta a su hijo; aquí hace que la imagen respete las esquinas
    // redondeadas. Sin este widget, Image.network seguiría siendo rectangular.
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      // Image.network descarga y muestra una imagen desde una URL. Flutter
      // mostrará el GIF animado cuando termine de cargarse.
      child: Image.network(imageUrl,
       // Usa el 70 % del ancho disponible, por lo que la imagen se adapta a
       // móviles anchos o estrechos sin tener un ancho fijo en píxeles.
       width: size.width * 0.7,
      // La altura sí es fija; BoxFit.cover ajusta y recorta la imagen si hace
      // falta para llenar este rectángulo sin deformarla.
      height: 150,
      fit: BoxFit.cover,
      // Flutter llama este constructor mientras la imagen remota se descarga.
      // context identifica dónde se dibuja; child es la imagen final; y
      // loadingProgress contiene el avance actual de la descarga.
      loadingBuilder:  (context, child, loadingProgress){
        // Cuando loadingProgress es null, Flutter ya recibió y decodificó la
        // imagen. Entonces se devuelve child para mostrar la imagen real.
        if(loadingProgress == null) return child;

        // Mientras exista progreso, se muestra este reemplazo temporal. Usa
        // las mismas dimensiones de la imagen para evitar que la interfaz
        // cambie de tamaño cuando termine la carga.
        return Container(
          width: size.width * 0.7,
          height: 150,
          // Padding separa el mensaje temporal de los bordes del contenedor.
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text('Mi amor esta enviando una imagen...'),
        );
      } ,),
      );
  }
}
