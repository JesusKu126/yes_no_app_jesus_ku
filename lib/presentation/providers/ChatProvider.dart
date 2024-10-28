import "package:flutter/material.dart";
import "package:yes_no_app_jesus_ku/domain/entities/message.dart";

class Chatprovider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola, Javi', fromWho: FromWho.me),
    Message(text: 'LLoras porque reprobaste tópicos?', fromWho: FromWho.me),
  ];
  //controlador para manejar la posición del scroll
  final ScrollController chatScrollContronller = ScrollController();
//Enviar un mensaje
  Future<void> sendMessage(String text) async {
    //El mensaje siempre va a ser "me" porque yo lo envío
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //agrega un elemento a la lista "messageList"
    messageList.add(newMessage);
    //notifica si algo de provider cambió para que se guarde en el estado
    notifyListeners();
    moveScroolToBottom();
  }

  //mover el scroll al último mensaje
  Future<void> moveScroolToBottom() async {
    //un pequeño atraso en la animación para garantizar que siempre se verá cuando se envíe mensajes cortos y rápidos
    await Future.delayed(const Duration(seconds: 1));
    //offset: posición de la animación
    //máxscrollExtent determina a lo máximo que el scroll puede dar
    chatScrollContronller.animateTo(
        chatScrollContronller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        //rebote al fina de la animación
        curve: Curves.easeOut);
  }
}
