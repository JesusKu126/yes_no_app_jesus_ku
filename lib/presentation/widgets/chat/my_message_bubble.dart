import 'package:flutter/material.dart';
import 'package:yes_no_app_jesus_ku/domain/entities/message.dart';
import 'package:intl/intl.dart';

class MyMessageBubble extends StatefulWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  State<MyMessageBubble> createState() => _MyMessageBubbleState();
}

class _MyMessageBubbleState extends State<MyMessageBubble> {
  bool isRead = false;

  @override
  void initState() {
    super.initState();

    // Cambia `isRead` a `true` después de 2 segundos para simular la lectura
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isRead = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final String formattedTime = DateFormat('hh:mm a').format(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment
          .end, // Esto asegura que la burbuja se alinee a la derecha
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // Alinea la burbuja a la derecha
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize
                    .min, // Asegura que el Row no ocupe más espacio del necesario
                children: [
                  // Mensaje alineado a la izquierda
                  Flexible(
                    child: Text(
                      widget.message.text,
                      style: const TextStyle(color: Colors.black),
                      overflow: TextOverflow
                          .ellipsis, // Evita desbordamiento del texto
                    ),
                  ),
                  // Coloca la hora y los checks a la derecha en un solo Row
                  const SizedBox(
                      width: 5), // Espacio entre el mensaje y la hora + checks
                  Padding(
                    padding: const EdgeInsets.only(
                        top:
                            2.0), // Ajuste vertical (mueve un poco hacia abajo)
                    child: Row(
                      mainAxisSize: MainAxisSize
                          .min, // Evita que ocupe más espacio del necesario
                      children: [
                        // Hora del mensaje (más pequeño)
                        Text(
                          formattedTime,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 10, // Hacemos la hora más pequeña
                          ),
                        ),
                        const SizedBox(
                            width:
                                5), // Separación pequeña entre hora y las palomitas
                        // Doble check con poca separación
                        Icon(
                          Icons.check,
                          size: 12, // Tamaño más pequeño de las palomitas
                          color: isRead ? Colors.blue : Colors.grey,
                        ),
                        Icon(
                          Icons.check,
                          size: 12, // Tamaño más pequeño de las palomitas
                          color: isRead ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
