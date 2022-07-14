import 'package:app_tareas_hotel/pages/habitacion.dart';
import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  const ButtonMenu({
    Key? key,
    required this.nombre_habitacion,
    required this.icono_habitacion
  }) : super(key: key);

  final String nombre_habitacion;
  final String icono_habitacion;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){

          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Habitacion(nombre_habitacion: nombre_habitacion)));
        },

        splashColor: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Image.asset(
                      'assets/images/${icono_habitacion}',
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(nombre_habitacion,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),)
                ],
              )
            ],
          ),
        ),


      ),

    );
  }
}
