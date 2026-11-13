

import 'package:tok_tik_app/domain/entities/video_post.dart';

class LocalVideoModel{
  // Este modelo conoce los nombres de los campos de los datos locales. La
  // entidad VideoPost no depende de si el origen es un Map, JSON o una API.
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name, 
    required this.videoUrl, 
    this.likes = 0, 
    this.views =0
  });

  // Convierte el Map<String, dynamic> de local_video_post.dart en un modelo
  // tipado; los valores por defecto protegen likes y views si no vienen.
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
    name: json['name'],
    videoUrl: json['videoUrl'],
    likes: json['likes'] ?? 0,
    views: json['views'] ?? 0
  );

  // Traduce el modelo de la fuente de datos a la entidad usada por la UI y el
  // provider. Este paso evita que esas capas dependan de claves como `name`.
  VideoPost toVideoPostEntity() => VideoPost(
    caption: name,
    videoUrl: videoUrl,
    likes: likes,
    views: views

  );

}

// toVideoPostEntity
