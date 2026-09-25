// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
    // Estos nombres reflejan exactamente las claves que devuelve la API.
    // Por eso pertenecen al modelo de infraestructura y no a la entidad
    // Message, que representa los datos que necesita la aplicación.
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    // Factory que traduce el mapa JSON recibido desde Dio a un objeto Dart.
    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    // Traduce los datos externos al formato interno del chat. Si la API
    // cambiara sus nombres de campos, el ajuste se concentraría aquí.
    Message toMessageEntity() => Message(
      text: answer,
      fromWho: FromWho.hers,
      imageUrl: image
    );
}
