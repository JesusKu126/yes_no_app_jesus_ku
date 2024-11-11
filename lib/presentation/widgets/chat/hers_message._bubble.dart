import 'package:flutter/material.dart';
import 'package:yes_no_app_jesus_ku/domain/entities/message.dart';

/*class HersMessageBubble extends StatelessWidget {
  final Message message;
  const HersMessageBubble({super.key, required this.message});

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

            // Texto de los mensajes
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),

        // Separación de mensajes
        const SizedBox(height: 5),

        _ImageBubble(imageURL: message.imageUrl!,),

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
    final String imageUrl;

    const _ImageBubble({required this.imageUrl});
    
    final size = MediaQuery.of(context).size;

    return ClipRRect(

        // Agregar borde a la imagen
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
        ));
  }
}*/
class HersMessageBubble extends StatelessWidget {
  final Message message;
  const HersMessageBubble({super.key, required this.message});

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
            borderRadius: BorderRadius.circular(20),
          ),
          // Separación (más bien ajuste de posición) de los mensajes
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // Texto de los mensajes
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        // Separación de mensajes
        const SizedBox(height: 5),

        // Verificar si `imageUrl` no es nulo antes de usar `_ImageBubble`
        if (message.imageUrl != null) _ImageBubble(imageUrl: message.imageUrl!),

        const SizedBox(height: 10),
      ],
    );
  }
}

//stles para widgets:
class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  // Constructor correcto para `_ImageBubble`
  const _ImageBubble({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      // Agregar borde a la imagen
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
