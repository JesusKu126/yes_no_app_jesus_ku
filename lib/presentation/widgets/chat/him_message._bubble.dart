import 'package:flutter/material.dart';

class HimMessageBubble extends StatelessWidget {
  const HimMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      // Alinear mis mensajes a la izquierda
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // Fondo de los mensajes
        Container(
          decoration: BoxDecoration(
              color: colors.secondary,

              // Hacer redondos los mensajes
              borderRadius: BorderRadius.circular(20)),

          // Separación (más bien ajuste de posición) de los mensajes
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

            // Texto de los mensajes
            child: Text(
              'Hola Jesús',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),

        // Separación de mensajes
        const SizedBox(height: 5),

        _ImageBubble(),

        const SizedBox(height: 10),
        // Todo: Imagen
      ],
    );
  }
}

//stles para widgets:
class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(

        // Agregar borde a la imagen
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'lib/images/javibb.jpg',
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
        ));
  }
}
