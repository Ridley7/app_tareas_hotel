import 'package:app_tareas_hotel/commons/HttpHandler.dart';
import 'package:app_tareas_hotel/widgets/button_menu.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel Torico Plaza"),
      ),

      body: SafeArea(
        child:  Container(
                padding: const EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: const [
                    //Primera Planta
                    ButtonMenu(nombre_habitacion: "1001", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "1002", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "1003", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "1004", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "1005", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "1006", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "1007", icono_habitacion: "llave_del_hotel.png",),

                    //Segunda planta
                    ButtonMenu(nombre_habitacion: "2001", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "2002", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "2003", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "2004", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "2005", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "2006", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "2007", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "2008", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "2009", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "2010", icono_habitacion: "llave_del_hotel.png",),

                    //Tercera planta
                    ButtonMenu(nombre_habitacion: "3001", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "3002", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "3003", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "3004", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "3005", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "3006", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "3007", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "3008", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "3009", icono_habitacion: "llave_del_hotel.png",),
                    ButtonMenu(nombre_habitacion: "3010", icono_habitacion: "llave_del_hotel.png",),

                    //Cuarta planta
                    ButtonMenu(nombre_habitacion: "Plaza Marquesa", icono_habitacion: "suite.png",),
                    ButtonMenu(nombre_habitacion: "Torico Plaza", icono_habitacion: "suite.png",),
                    ButtonMenu(nombre_habitacion: "Torre Salvador", icono_habitacion: "suite.png",),
                    ButtonMenu(nombre_habitacion: "Escalinata", icono_habitacion: "suite.png",),

                    //Mantenimiento
                    ButtonMenu(nombre_habitacion: "Mantenimiento", icono_habitacion: "mantenimiento.png",),
                    ButtonMenu(nombre_habitacion: "Otros", icono_habitacion: "otros.png",),
                  ],
                ),
              )
        ),
      );
  }
}

