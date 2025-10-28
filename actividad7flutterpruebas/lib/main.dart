import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Card(
              child: Container(
                child: Text('hola que tal estais'),
                padding: EdgeInsets.all(15),
              ),
              color: Colors.amber,
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
          )
        ),
      ),
    );
  }
}
