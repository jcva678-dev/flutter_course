import 'package:flutter/material.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';
import 'package:tok_tik_app/presentation/widgets/shared/fullscreen_player.dart';
import 'package:tok_tik_app/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;
  const VideoScrollableView({
    required this.videos,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // PageView crea una página por video y permite recorrerlas verticalmente,
    // como un feed de videos cortos. builder construye las páginas bajo demanda.
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      // El swipe cambia entre los elementos ya cargados; actualmente no llama
      // a DiscoverProvider.loadNextPage() ni obtiene una página adicional.
      itemBuilder: (context, index) {
        // El índice de la página selecciona los datos que se mostrarán en ella.
        final VideoPost videoPost = videos[index];

        // Cada página ocupa el espacio disponible. El Stack pone el reproductor
        // de fondo y permite superponer encima los botones laterales.
        return Stack(
          children: [
            // Expande el reproductor para cubrir la página completa.
            SizedBox.expand(
              child: FullscreenPlayer(
                videoUrl: videoPost.videoUrl, 
                caption: videoPost.caption
              ),
            ),
            // Los controles quedan anclados a la esquina inferior derecha,
            // independientemente del tamaño del video.
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(videoPost: videoPost)
              ),
          ],
        );
      },
      
    );
  }
}
