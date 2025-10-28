import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo Column y Row'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Texto 1', style: TextStyle(fontSize: 24)),
                  Text('Texto 2', style: TextStyle(fontSize: 24)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Botón 1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Botón 2'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

