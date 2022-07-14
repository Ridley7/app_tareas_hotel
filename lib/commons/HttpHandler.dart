
import 'dart:convert';

import 'package:app_tareas_hotel/models/Empleado.dart';
import 'package:app_tareas_hotel/models/tarea_habitacion.dart';
import 'package:http/http.dart' as http;

class HttpHandler{

  //Metodo para enviar las tareas hechas por un empleado
  Future<void> subirListaDeTareasPorTrabajador(Empleado empleado, DateTime fecha, String numero_habitacion, List<TareaHabitacion> tareas) async{

    print("El empleado que has elegido es: ");
    print(empleado.nombre);

    await Future.delayed(const Duration(seconds: 4));

  }

  Future<List<TareaHabitacion>> fetchTaskByRoomNumber(String nombre_habitacion) async {

    final response = await http.get(Uri.parse("http://www.elmilagrodeteruel.net/api/tasksRoom/$nombre_habitacion"));

    if(response.statusCode == 200){

      List lista_tareas = jsonDecode(response.body);
      
      return lista_tareas.map((tarea) => TareaHabitacion.fromJson(tarea)).toList();

    }else{
      throw Exception("Fallo al cargar las tareas");
    }
  }

  Future<List<Empleado>> getWorkers() async{

    final response = await http.get(Uri.parse('http://www.elmilagrodeteruel.net/api/workers'));

    if(response.statusCode == 200){

      var workers_json = jsonDecode(response.body);
      List lista_trabajadores = workers_json['data'];

      return lista_trabajadores.map((trabajador) => Empleado.fromJson(trabajador)).toList();

    }else{
      throw Exception("Error: No se puede obtener la lsita de trabajadores ${response.statusCode}");
    }

  }

}