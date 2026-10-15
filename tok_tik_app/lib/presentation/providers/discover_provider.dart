

import 'package:flutter/material.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';
import 'package:tok_tik_app/infrastructure/models/local_video_model.dart';
import 'package:tok_tik_app/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier{

  // Por ahora los datos viven localmente. Un repository o datasource solo
  // será necesario cuando cambie la fuente (API, base de datos) o se requiera
  // aislarla para pruebas; no hace falta introducirlos todavía.

  // La pantalla podrá usar esta bandera para mostrar un loader mientras se
  // obtiene la primera página de contenido.
  bool initialLoading = true;

  // Estado que la UI observa: cada VideoPost ya está en el formato que la
  // aplicación entiende, no en el Map<String, dynamic> de los datos locales.
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async{
    // Provider inicia este método al crear el estado. Ahora no hay una espera:
    // la transformación local ocurre enseguida y el indicador de carga podría
    // no alcanzar a verse. El Future.delayed comentado serviría para simular
    // una solicitud lenta durante el ejercicio.
    // await Future.delayed(const Duration(seconds: 2));

    // map transforma cada mapa local en una entidad VideoPost. toList() es
    // necesario porque map devuelve un Iterable perezoso y videos necesita
    // recibir una lista concreta.
    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    // addAll conserva los videos que ya existían y añade esta tanda local.
    videos.addAll(newVideos);
    initialLoading = false;

    // Notifica a los widgets con context.watch<DiscoverProvider>() para que
    // reflejen el nuevo estado en pantalla.
    notifyListeners();
  }
}
