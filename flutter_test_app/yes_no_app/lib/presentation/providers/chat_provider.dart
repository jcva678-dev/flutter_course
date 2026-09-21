import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  // Estado temporal del chat en memoria. ChangeNotifier permite avisar a la
  // interfaz cuando esta lista cambia, sin que los widgets la administren.
  List<Message> messagesList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresate del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async{
    if (text.isEmpty) return;

    // Se crea la entidad con sus datos y después se incorpora al estado.
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    // Los widgets que usan context.watch<ChatProvider>() se reconstruirán
    // para mostrar el mensaje que acabamos de agregar.
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut);
  }

  Future<void> herReply() async{
    final herMessage = await getYesNoAnswer.getAnswer();
    messagesList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }
}
