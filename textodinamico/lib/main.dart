import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppDin createState() => _MainAppDin();
}
  
class _MainAppDin extends State<MainApp>{
  String _texto = "Puro";
  void _concatenar(){
    setState(() {
      _texto+="Juan";
    });
  }

     @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_texto),
              ElevatedButton(
                onPressed: _concatenar,
                child: Text('Cambiar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}