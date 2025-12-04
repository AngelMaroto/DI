import 'package:flutter/material.dart';

void main() {
  runApp(const InsertarDato());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

class InsertarDato extends StatefulWidget {
  const InsertarDato({super.key});

  @override
  State<InsertarDato> createState() => _InsertarDatoState();
}

class _InsertarDatoState extends State<InsertarDato> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}