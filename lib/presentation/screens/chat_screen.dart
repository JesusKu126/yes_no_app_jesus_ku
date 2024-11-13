import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_jesus_ku/domain/entities/message.dart';
import 'package:yes_no_app_jesus_ku/presentation/providers/ChatProvider.dart';
import 'package:yes_no_app_jesus_ku/presentation/widgets/chat/hers_message._bubble.dart';
import 'package:yes_no_app_jesus_ku/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_jesus_ku/presentation/widgets/share/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Usamos un Column para alinear el avatar y el nombre de forma vertical
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('lib/images/JADE.jpeg'),
              radius: 20, // Tamaño del avatar
            ),
            SizedBox(width: 10), // Espacio entre la imagen y el nombre
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Alineamos el nombre a la izquierda
              children: [
                Text(
                  'Jade West',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4), // Espacio entre el nombre y el subtítulo
                Text(
                  'En línea',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        // Este botón está al final del AppBar, si necesitas agregar un botón
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: _ChatView(),
    );
  }
}

// El body se trabaja aquí
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Pedirle al widget que esté pendiente de todos los cambios
    final chatProvider = context.watch<Chatprovider>();
    return SafeArea(
      // Mueve al 'Mundo' a una zona segura
      child: Padding(
        // Para que no estén pegados a los bordes
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Fondo del chat
            Expanded(
                // ListView dice cuantos elementos tengo y puede cambiar, por eso no es const
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              // Como va a construir cada elemento
              itemBuilder: (context, index) {
                //instancia que sabrá quien envía el mensaje
                final message = chatProvider.messageList[index];
                // Indica cual es el elemento que está rendirizando en este momento
                return (message.fromWho == FromWho.hers)
                    ? HersMessageBubble(
                        message: message,
                      )
                    : MyMessageBubble(
                        message: message,
                      );
              },
            )),

            // Caja de texto
            MessageFieldBox(
              //una vez que tenga el mensaje envialo
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
