import 'package:app_tareas_hotel/commons/HttpHandler.dart';
import 'package:app_tareas_hotel/models/tarea_habitacion.dart';
import 'package:app_tareas_hotel/widgets/tab_habitacion.dart';
import 'package:flutter/material.dart';

class Habitacion extends StatefulWidget {
  const Habitacion({required this.nombre_habitacion, Key? key}) : super(key: key);

  final String nombre_habitacion;

  @override
  State<Habitacion> createState() => _HabitacionState();
}

class _HabitacionState extends State<Habitacion> with SingleTickerProviderStateMixin{

  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Hotel Torico Plaza",
          style: TextStyle(
            color: Colors.white
          ),
        ),

        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Limpieza"),
            Tab(text: "Mantenimiento"),
            Tab(text: "Otros")
          ],
        ),
      ),

      body: FutureBuilder(
        future: HttpHandler().fetchTaskByRoomNumber(widget.nombre_habitacion),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                "Ha ocurrido un error: ${snapshot.error}"
              ),
            );
          }else if(snapshot.hasData){

            List<TareaHabitacion> lista_tareas =  snapshot.data as List<TareaHabitacion>;

            //Filtramos la lista de tareas
            List<TareaHabitacion> lista_limpieza = lista_tareas.where((element) => element.typeTaskName == "Limpieza").toList();
            List<TareaHabitacion> lista_mantenimiento = lista_tareas.where((element) => element.typeTaskName == "Mantenimiento").toList();
            List<TareaHabitacion> lista_otros = lista_tareas.where((element) => element.typeTaskName == "Otros").toList();

            return TabBarView(
              controller: _tabController,
              children:  [
                TabHabitacion(nombre_habitacion: widget.nombre_habitacion, lista_tareas: lista_limpieza,),
                TabHabitacion(nombre_habitacion: widget.nombre_habitacion, lista_tareas: lista_mantenimiento,),
                TabHabitacion(nombre_habitacion: widget.nombre_habitacion, lista_tareas: lista_otros,),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
