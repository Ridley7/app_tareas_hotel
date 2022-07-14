import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class UploadDataAnimation extends StatelessWidget {
  const UploadDataAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Flexible(
                child: Text(
                  "Por favor espere, se estan cargando los datos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 45,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
          ],
        ),

        //Es posible que tengamos que poner un IgnorePointer
        const Flexible(
          child: FlareActor(
            "assets/flare_animations/check_registration.flr",
            animation: "animation",
          ),
        )

      ],
    );
  }
}