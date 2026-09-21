import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  // Estado temporal del chat en memoria. ChangeNotifier permite avisar a la
  // interfaz cuando esta lista cambia, sin que los widgets la administren.
  List<Message> messagesList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresate del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async{
    // Se crea la entidad con sus datos y después se incorpora al estado.
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    // Los widgets que usan context.watch<ChatProvider>() se reconstruirán
    // para mostrar el mensaje que acabamos de agregar.
    notifyListeners();
  }
}
