import 'package:app_tareas_hotel/commons/HttpHandler.dart';
import 'package:app_tareas_hotel/commons/network_status.dart';
import 'package:app_tareas_hotel/models/Empleado.dart';
import 'package:app_tareas_hotel/models/tarea_habitacion.dart';
import 'package:app_tareas_hotel/providers/network_notifiers.dart';
import 'package:app_tareas_hotel/widgets/tab_habitacion/title_tab.dart';
import 'package:app_tareas_hotel/widgets/tab_habitacion/upload_data_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'tab_habitacion/respuesta_servidor.dart';

class TabHabitacion extends StatefulWidget {

  const TabHabitacion({
    required this.nombre_habitacion,
    required this.lista_tareas,
    Key? key
  }) : super(key: key);

  final String nombre_habitacion;
  final List<TareaHabitacion> lista_tareas;

  @override
  State<TabHabitacion> createState() => _TabHabitacionState();
}

class _TabHabitacionState extends State<TabHabitacion> {

  @override
  Widget build(BuildContext context) {

    int? currentWorkerValue = 0;
    TextEditingController subVal = TextEditingController();

    return Consumer<NetworkNotifiers>(
      builder: (_, notifier, __) {

        if(notifier.status == NetworkStatus.none){

          //Cuerpo principal de la app donde se muestran todas las tareas.
          return Column(
            children: [
              //Nombre de la habitación
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  //Titulo de la habitación
                  TitleTab(titulo_habitacion: widget.nombre_habitacion),
                ],
              ),

              //Lista de tareas
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white
                    ),

                    child: ListView.builder(
                        itemCount: widget.lista_tareas.length,
                        itemBuilder: (context, index){
                          return Slidable(
                            //Widget para añadir una nota
                              endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    //Slide para añadir una nota
                                    SlidableAction(
                                      flex: 2,
                                      onPressed: (context){
                                        subVal.text = widget.lista_tareas[index].observaciones;
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context){
                                              return AlertDialog(
                                                title: const Text('Nota'),
                                                content: SizedBox(
                                                  height: MediaQuery.of(context).size.height / 4.0,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: TextField(
                                                          controller: subVal,
                                                          maxLines: 10,
                                                          textAlign: TextAlign.left,
                                                          decoration: const InputDecoration(
                                                              border: InputBorder.none,
                                                              hintText: 'Observaciones',
                                                              hintStyle: TextStyle(color: Colors.grey)
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      //Guardamos las notas que añaden los usuarios en la lista
                                                      widget.lista_tareas[index].observaciones = subVal.text;
                                                      subVal.text = "";
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30)),
                                                        primary: const Color(0xff2da9ef),
                                                        //onPrimary: Colors.black,
                                                        textStyle: const TextStyle(color: Colors.white)),
                                                    child: const Text('Añadir'),
                                                  ),
                                                ],
                                              );
                                            }
                                        );
                                      },
                                      backgroundColor: Colors.indigo,
                                      foregroundColor: Colors.white,
                                      icon: Icons.note,
                                      label: 'Archive',
                                    ),
                                  ]
                              ),

                              //Widget para seleccionar que tareas son las que se han realizado
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
                                  title: Text(widget.lista_tareas[index].taskName, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
                                  trailing: widget.lista_tareas[index].realizado ? const Icon(Icons.check_circle, color: Colors.greenAccent,) : const Icon(Icons.cancel, color: Colors.redAccent,),
                                  onTap: (){
                                    //Indicamos el check o no de la tarea
                                    widget.lista_tareas[index].realizado = !widget.lista_tareas[index].realizado;

                                    //print("La tarea ${widget.lista_tareas[index].taskName} ahora esta: ${widget.lista_tareas[index].realizado}");

                                    setState((){});
                                  },
                                ),
                              )
                          );
                        }
                    ),
                  )
              ),

              //Boton enviar
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Seleccione Trabajador:"),
                                  ),

                                  const SizedBox(
                                    height: 5.0,
                                  ),

                                  const Divider(
                                    color: Colors.blueAccent,
                                    thickness: 1.8,
                                  ),

                                  StatefulBuilder(
                                      builder: (BuildContext context, StateSetter setState){
                                        return FutureBuilder(
                                          future: HttpHandler().getWorkers(),
                                          builder: (context, snapshot) {
                                            if(!snapshot.hasData){
                                              return const Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            }else{

                                              List<Empleado> listaEmpleados = snapshot.data as List<Empleado>;

                                              return Column(
                                                  children: listaEmpleados.map((empleado) => RadioListTile(
                                                      value: empleado.id,
                                                      groupValue: currentWorkerValue,
                                                      title: Text(empleado.nombre),
                                                      onChanged: (value){
                                                        setState((){
                                                          //Le indicamos al provider cual es el empleado seleccionado
                                                          notifier.setEmpleado(currentWorker: empleado);
                                                          currentWorkerValue = value as int?;
                                                        });
                                                        //print("El value es: ${value}");
                                                      }
                                                  )).toList()
                                              );
                                            }
                                          },
                                        );
                                      }
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      //Boton para enviar datos
                                      TextButton(
                                          onPressed: (){

                                            //Si no se ha elegido ningún trabajador evitamos que se suban datos
                                            if(currentWorkerValue != 0){
                                              //Aqui necesitamos un provider para empezar a subir datos
                                              notifier.uploadTaskPerWorker(widget.nombre_habitacion, widget.lista_tareas);
                                            }
                                            Navigator.pop(context);

                                          },
                                          child: const Text("Enviar")
                                      ),
                                      //Boton para cancelar la subida de datos
                                      TextButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Cancelar")
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                      textStyle: const TextStyle(fontSize: 14)),
                  child: const Text('Enviar'),
                ),
              )
            ],
          );

        }
        else if(notifier.status == NetworkStatus.uploading){
          return const UploadDataAnimation();
        }else if(notifier.status == NetworkStatus.uploaded) {
          return const RespuestaServidor(mensaje: "Los datos se han cargado correctamente", imagen: "check.png",);
        }else{
          return const RespuestaServidor(mensaje: "Ha habido un error con la carga de datos. Es posible que no se hayan almacenado correctamente", imagen: "cross.png",);
        }
      },
    );
  }
}






