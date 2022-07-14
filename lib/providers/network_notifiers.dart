
import 'package:app_tareas_hotel/commons/HttpHandler.dart';
import 'package:app_tareas_hotel/commons/network_status.dart';
import 'package:app_tareas_hotel/models/Empleado.dart';
import 'package:app_tareas_hotel/models/tarea_habitacion.dart';
import 'package:flutter/material.dart';

class NetworkNotifiers extends ChangeNotifier{

  NetworkStatus status = NetworkStatus.none;
  late Empleado empleado;

  setEmpleado({required Empleado currentWorker}){
    empleado = currentWorker;
  }

  resetStatus(){
    status = NetworkStatus.none;
  }

  //Aqui deberiamos recibir las tareas, el nombre del trabajador, y la fecha actual quizas??
  uploadTaskPerWorker(String numeroHabitacion, List<TareaHabitacion> tareas) async{

    //Indicamos a la UI de la aplicación que se estan subiendo los datos
    status = NetworkStatus.uploading;
    notifyListeners();

    //Realizamos la petición web.
    try{

      //Obtenemos la fecha de hoy
      DateTime fecha = DateTime.now();

      //Enviamos datos al servidor
      await HttpHandler().subirListaDeTareasPorTrabajador(empleado, fecha, numeroHabitacion, tareas);

      //Si no ha habido ningún problema cambiamos el status para que se nos enseñe en la UI
      status = NetworkStatus.uploaded;

    }catch (e){

      //Si ha habido errores marcamos el status para notificarlo a traves de la UI
      status = NetworkStatus.error;
    }

    //Indicamos que se repinte la UI en función de la variable status.
    notifyListeners();
  }

}