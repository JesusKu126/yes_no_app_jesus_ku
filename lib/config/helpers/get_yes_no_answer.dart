import 'package:dio/dio.dart';
import 'package:yes_no_app_jesus_ku/domain/entities/message.dart';
import 'package:yes_no_app_jesus_ku/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {
//Se crea instancia de la clase Dio
//Par manejar las peticiones HTTP
  final _dio = Dio();
//el guión bajo significa que es privado
  Future<Message> getAnswer() async {
// almacenar la petición en una variable
    final response = await _dio.get('https://yesno.wtf/api');
    //Almacenar la data de la respuesta en una variable
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    //devuelve la instancia de "message" creada en el modelo
    return yesNoModel.toMesageEntity();
  }
//obtener la respuesta
}
