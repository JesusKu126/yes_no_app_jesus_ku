import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  //Emite el valor cambiado
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'Termina tu mensaje con "?',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,

      // Icono de enviar mensaje FUNCIONAL
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          //notifica que el texto que escribo ya cambió
          onValue(textValue);
          textController.clear();
        },
      ),
    );
    // Escribir dentro de la app
    return TextFormField(
      // El foco del keyboard
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
