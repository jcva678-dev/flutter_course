

import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  // Dio es el cliente HTTP. Se conserva una sola instancia para reutilizar su
  // configuración y realizar solicitudes a la API desde este helper.
  final _dio= Dio();

  Future<Message> getAnswer() async {
    // await pausa únicamente esta función mientras llega la respuesta; la UI
    // permanece disponible porque Dart no bloquea el hilo de la aplicación.
    final response = await _dio.get("https://yes-no-wtf.vercel.app/api");

    // La API devuelve JSON. Primero se interpreta con un modelo que conoce
    // esa estructura y luego se convierte a la entidad que usa la app.
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
  
    return yesNoModel.toMessageEntity();


  }
}
