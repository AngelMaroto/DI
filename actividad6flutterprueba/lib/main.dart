import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Actividad 6',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio 6'),
          ),
        body: Column(
          children: <Widget>[
            Text('Texto 1'),
            Text('Texto 2'),
            Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Text('Boton 1')),
                ElevatedButton(onPressed:(){}, child: Text('boton 2'))
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )
          ],
        ),  
      ),
    );
  }
}

