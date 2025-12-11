import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/datasource/datasource/datasource.dart';

void main() {
  final dataSource = ProductDataSource();
  //final repository = ProductRepository(dataSource);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Lista()));
  }
}

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: ProductDataSource().obtenerJSON(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          var productos = snapshot.data!;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (BuildContext context, int index) {
              var producto = productos[index];
              return ListTile(
                title: Text(producto['nombre'].toString()),
                subtitle: Text(producto['precio'].toString()),
              );
            },
          );
        } else {
          return Center(child: Text("sin datos"));
        }
      },
    );
  }
}
