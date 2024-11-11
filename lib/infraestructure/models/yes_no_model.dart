//El modelo define que qué datos debe
//tener la aplicación. Investiga MVC
//modelo vista controlador: Patrón de diseño de software
//vista: Pantalla, el teatro
//controlador: el titiritero, lógica de como va a funcionar
// modelo: info,las marionetas
// Diferencia entre constructor y factory= El constructor crea una instancia y factory puede o no crear una instancia
//No es un factorial, es una fábrica. Es una falso cognado.
//Key value= es la estructura del formato Json
//quicktype: app para parsear: parsear, parse es convertir un dato a un formato
// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'package:yes_no_app_jesus_ku/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );
  Message toMesageEntity() => Message(
      //condicional ternario para darle valor a los mensajes
      text: answer == 'yes'
          ? 'Sí'
          : answer == 'no'
              ? 'No'
              : 'Quizás',
      //siempre va a ser de ella
      fromWho: FromWho.hers,
      //será el gif
      imageUrl: image);
}
