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
        appBar: AppBar(
          title: Text("hola holita vecinito"),
        ),
        body: Center(
          child: Text("adios"),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Icon(Icons.add),),
      ),
    );
  }
}