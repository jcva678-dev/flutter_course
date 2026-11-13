

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik_app/config/theme/app_theme.dart';
import 'package:tok_tik_app/presentation/providers/discover_provider.dart';
import 'package:tok_tik_app/presentation/screens/discover/discover_screen.dart';

// Punto de entrada de Flutter: monta MyApp y da inicio al árbol de widgets.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // create se ejecuta cuando un descendiente solicita por primera vez
          // DiscoverProvider; en este caso, DiscoverScreen lo hace con watch.
          // El provider conserva esta instancia mientras siga en el árbol y
          // ChangeNotifierProvider la libera con dispose al ser removido.
          // `_` representa el BuildContext que create recibe pero no necesita.
          // El operador de cascada (`..`) llama loadNextPage() sobre la misma
          // instancia recién creada y, aun así, la expresión devuelve el
          // DiscoverProvider. La carga empieza sin esperar su Future, así que
          // create devuelve enseguida el objeto que Provider debe administrar.
          create: (_) => DiscoverProvider()..loadNextPage(),
        ),
      ],
      // Todos los widgets por debajo de MultiProvider pueden acceder al
      // DiscoverProvider; MaterialApp crea dentro de ese alcance la pantalla.
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen()
      ),
    );
  }
}
