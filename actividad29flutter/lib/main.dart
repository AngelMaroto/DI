import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => PantallaA(),
        '/b': (context) => PantallaB(),
        '/c': (context) => PantallaC(),
      },
    );
  }
}

class PantallaA extends StatelessWidget {
  const PantallaA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child:  GestureDetector(
        onHorizontalDragEnd: (details) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PantallaC()),
          );
        }, 
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PantallaB()),
          );
        },
        child: Container(
          color: Colors.blue,
          height: 100,
          width: 100,
          child: Center(child: Text('Toca aquí')),
        ),
      ),
      ) 
      
    );
  }
}

class PantallaB extends StatelessWidget {
  const PantallaB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("has dado doble tap")));
  }
}

class PantallaC extends StatelessWidget {
  const PantallaC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("has arrastrado a la derecha")));
  }
}
