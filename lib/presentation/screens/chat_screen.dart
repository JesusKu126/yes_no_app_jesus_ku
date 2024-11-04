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
        //leading es el espacio que hay antes del título
        //se envuenle en padding para que se haga pequeño
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('lib/images/JAVI.png'),
          ),
        ), //avatar circular
        title: const Text('JavierMTZ'),
        centerTitle: true, //para forzar centrar el texto
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
              itemCount: chatProvider.messageList.length,
              // Como va a construir cada elemento
              itemBuilder: (context, index) {
                //instancia que sabrá quien envía el mensaje
                final message = chatProvider.messageList[index];
                // Indica cual es el elemento que está rendirizando en este momento
                return (message.fromWho == FromWho.hers)
                    ? const HersMessageBubble()
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
