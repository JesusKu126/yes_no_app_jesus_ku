import 'package:flutter/material.dart';
import 'package:yes_no_app_jesus_ku/presentation/widgets/chat/him_message._bubble.dart';
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
              itemCount: 100,
              // Como va a construir cada elemento
              itemBuilder: (context, index) {
                // Indica cual es el elemento que está rendirizando en este momento
                return (index % 2 == 0)
                    ? const HimMessageBubble()
                    : const MyMessageBubble();
              },
            )),

            // Caja de texto
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
