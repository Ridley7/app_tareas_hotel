import 'package:flutter/material.dart';

class TitleTab extends StatelessWidget {
  const TitleTab({
    Key? key,
    required this.titulo_habitacion,
  }) : super(key: key);

  final String titulo_habitacion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Habitación\n $titulo_habitacion",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 45,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}