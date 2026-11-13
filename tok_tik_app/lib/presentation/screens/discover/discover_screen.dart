
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik_app/presentation/providers/discover_provider.dart';
import 'package:tok_tik_app/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // watch lee el estado actual y suscribe esta pantalla a los cambios del
    // provider. Cuando loadNextPage notifique, este build se ejecutará de nuevo.
    final discoverProvider = context.watch<DiscoverProvider>();

    return Scaffold(
      // Mientras se carga la tanda inicial se muestra progreso; al terminar,
      // el provider cambia initialLoading y esta rama presenta las páginas.
     body: discoverProvider.initialLoading
        ? const Center( child: CircularProgressIndicator() )
        : VideoScrollableView(videos: discoverProvider.videos),
    );
  }
}
