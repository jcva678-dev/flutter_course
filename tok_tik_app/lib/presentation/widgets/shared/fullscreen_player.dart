import 'package:flutter/material.dart';
import 'package:tok_tik_app/presentation/widgets/shared/video_background.dart';
import 'package:video_player/video_player.dart';

// Stateful porque VideoPlayerController administra un recurso del reproductor
// nativo que debe crearse, usarse y liberarse durante la vida del widget.
class FullscreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;
  const FullscreenPlayer({
    super.key, 
    required this.videoUrl, 
    required this.caption});

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {

  // El controller conecta Flutter con el reproductor de video de la plataforma.
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    // Se crea una vez al insertar este State en el árbol. La cascada configura
    // el mismo controller: sin sonido, en bucle y con reproducción automática.
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    // Libera el reproductor nativo cuando esta página de video sale del árbol.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // FutureBuilder escucha la inicialización asíncrona y vuelve a ejecutar
    // builder cuando el Future termina. Es preferible conservar ese Future en
    // el State si el widget puede reconstruirse, en vez de crear operaciones
    // asíncronas nuevas desde build().
    return FutureBuilder(
      future: controller.initialize(), 
      builder: (context, snapshot){
        // Antes de completar la inicialización, todavía no se conoce la
        // proporción ni se puede mostrar el video listo.
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.red),
          );
        }
        // Este ejemplo asume que initialize terminó bien. Si puede fallar,
        // también habría que mostrar un estado de error con snapshot.hasError.
        return GestureDetector(
          onTap: () {
            // Alterna entre pausar y reanudar al tocar el área del video.
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            // Conserva la proporción original del archivo para evitar deformar
            // la imagen del video.
            aspectRatio: controller.value.aspectRatio,
            child: Stack(children: [
              // Stack dibuja primero el video y luego las capas superpuestas.
              VideoPlayer(controller),
              // Capa oscura en la parte inferior para mejorar la lectura del
              // caption sobre imágenes de distinto brillo.
              VideoBackground(stops: const [0.8, 1.0]),
          
              // Positioned ubica el caption respecto al borde inferior
              // izquierdo del Stack que ocupa el área del video.
              Positioned(
                bottom: 50,
                left: 20,
                child: _VideoCaption(caption: widget.caption)
                ),
          
              ]),
          ),
        );
      });
  }
}


class _VideoCaption extends StatelessWidget{

  final String caption;

  const _VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    // MediaQuery usa el ancho de la pantalla como referencia para limitar el
    // texto; no determina su posición, que la controla Positioned arriba.
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
