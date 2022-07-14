
import 'package:app_tareas_hotel/pages/home.dart';
import 'package:app_tareas_hotel/providers/network_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NetworkNotifiers())
    ],
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Limpieza Hotel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home()
    );
  }
}
