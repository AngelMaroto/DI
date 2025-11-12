import 'package:flutter/material.dart';
void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 debugShowCheckedModeBanner: false, // Para quitar la marca de debug
 home: Scaffold(
 appBar: AppBar(
 title: Text('Hello World App - Windows'),
 ),
 body: Center(
 child: Text(
 'Hello, World!',
 style: TextStyle(fontSize: 24),
 ),
 ),
 ),
 );
 }
}
