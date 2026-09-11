

import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://bluewin-prod-sc-images.imgix.net/2024/10/24/24c63c64-d3cc-4903-9f60-6047ea62f158.jpeg?w=256&auto=format&s=a91e7d81bcb7fcff3d0e0089fb594885&rect=217%2C0%2C867%2C867'),
          ),
        ),
        title: const Text('Mi Juli'),
      ),
      body: _ChatView(),
    );
  }
}


class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    // Evita que el contenido quede debajo de zonas del sistema, como la barra
    // de estado, la cámara frontal o la barra de navegación del dispositivo.
    return SafeArea(
      // Separa horizontalmente el contenido de los bordes de la pantalla para
      // que los mensajes y el campo de texto no queden demasiado pegados.
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        // Organiza el chat verticalmente: arriba queda la lista de mensajes y
        // abajo el área destinada a escribir o mostrar contenido adicional.
        child: Column(
          children: [
            // Ocupa todo el espacio vertical disponible sin desplazar el
            // contenido que se encuentra debajo de la lista.
            Expanded(
              // Construye los mensajes bajo demanda y permite desplazarse por
              // el historial del chat sin crear todos sus elementos a la vez.
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return MyMessageBubble();
                },
              ),
            ),
            Text("Hola mundo"),
          ],
        ),
      ),
    );
  }
}
