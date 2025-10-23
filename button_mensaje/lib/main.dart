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
        body: Column(
          children: <Widget>[
            Text("Hola texto1"),
            Text("hola texto2"),
            ElevatedButton(
              onPressed: () {
                print("Hola");
              },
              child: Text("Mostrar texto"),
            ),
          ],
        ),
      ),
    );
  }
}
