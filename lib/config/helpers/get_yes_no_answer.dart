import 'package:dio/dio.dart';
import 'package:yes_no_app_jesus_ku/domain/entities/message.dart';

class GetYesNoAnswer {
//Se crea instancia de la clase Dio
//Par manejar las peticiones HTTP
  final _dio = Dio();
//el guión bajo significa que es privado
  Future<Message> getAnswer() async {
// almacenar la petición en una variable
    final response = await _dio.get(' https:/yesno.wtf/api');
    throw UnimplementedError();
//provocar o generar un error
  }
//obtener la respuesta
}
