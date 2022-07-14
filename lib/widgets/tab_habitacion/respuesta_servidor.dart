import 'package:app_tareas_hotel/providers/network_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RespuestaServidor extends StatelessWidget {

  final String mensaje;
  final String imagen;

  const RespuestaServidor({
    required this.mensaje,
    required this.imagen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),

        Image.asset(
            "assets/images/${imagen}"
        ),

        const SizedBox(
          height: 10,
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Text(
                  mensaje,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                )
            )
          ],
        ),

        const SizedBox(
          height: 20,
        ),

        Consumer<NetworkNotifiers>(
          builder: (_, notifier, __) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () {

                  notifier.resetStatus();

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0)
                    ),
                    primary: Colors.grey[300],
                    onPrimary: Colors.black,
                    textStyle: const TextStyle(
                      fontSize: 14,
                    )),
                child: const Text('ACEPTAR'),
              ),
            );
          },
        )
      ],
    );
  }
}