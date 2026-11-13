import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik_app/config/helpers/human_formats.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  
  // Recibe los datos del video que está visible para mostrar sus estadísticas.
  final VideoPost videoPost;
  const VideoButtons({super.key,
  required this.videoPost});

  @override
  Widget build(BuildContext context) {
    // Agrupa verticalmente las acciones/estadísticas que se superponen al video.
    return Column(
      children:[
        _CustomIconButton(
          value: videoPost.likes, 
          icon: Icons.favorite, 
          iconColor: Colors.red
        ),
        const SizedBox(height: 20),

        _CustomIconButton(
          value: videoPost.views, 
          icon: Icons.remove_red_eye_outlined
        ),
        const SizedBox(height: 20),
        // animate_do rota este icono continuamente; la animación es visual y
        // no modifica el estado de reproducción del VideoPlayerController.
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: _CustomIconButton(
            value: 0, 
            icon: Icons.play_circle_outline
          ),
        ),
      ]
    );
  }
}



class _CustomIconButton extends StatelessWidget {
  // Componente reutilizable para mostrar un icono y una cifra compacta.
  final int value;
  final IconData icon;
  final Color? color;

  const _CustomIconButton({
    required this.value, 
    required this.icon, 
    iconColor}): color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Actualmente es solo visual: onPressed está vacío, así que tocarlo no
        // cambia el número ni guarda un like.
        IconButton(onPressed: (){}, icon: Icon(icon, size: 30, color: color)),
        if(value > 0)
        Text(HumanFormats.HumanReadableNumber(value.toDouble()))
      ],
    );
  }
}
