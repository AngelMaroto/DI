import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => PantallaA(),
        '/b': (context) => PantallaB()
      },
    );
  }
}
class PantallaA extends StatelessWidget{
  const PantallaA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla A'),),
      body: Column(
        children: [
          Text("Pantalla A"),
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/b');
            },
            child: Text("Ir a pantalla B"),)
        ],
      )
    );
  }
}

class PantallaB extends StatelessWidget{
  const PantallaB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla B'),),
      body: Column(
        children: [
          Text("Pantalla B"),
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Volver a pantalla a"),)
        ],
      )
    );
  }
}

