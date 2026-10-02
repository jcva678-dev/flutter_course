
import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Placeholder temporal: cuando la pantalla observe DiscoverProvider,
      // aquí decidirá entre mostrar un loader o la lista de videos.
      body: Center(
        child: Text("DiscoverScreen"),
      ),
    );
  }
}
