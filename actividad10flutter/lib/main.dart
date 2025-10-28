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
        body: ListView(
          children: [
            Container(
              child: ListTile(
                leading: Image.network('https://placehold.co/600x400.png'),
                title: Text('Nombre'),
                subtitle: Text('Precio'),
                contentPadding: EdgeInsets.all(20),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
                border: Border.all(color: Colors.red, width: 5),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(10),
            ),
            Container(
              child: ListTile(
                leading: Image.network('https://placehold.co/600x400.png'),
                title: Text('Nombre'),
                subtitle: Text('Precio'),
                contentPadding: EdgeInsets.all(20),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
                border: Border.all(color: Colors.red, width: 5),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(10),
            ),
            Container(
              child: ListTile(
                leading: Image.network('https://placehold.co/600x400.png'),
                title: Text('Nombre'),
                subtitle: Text('Precio'),
                contentPadding: EdgeInsets.all(20),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
                border: Border.all(color: Colors.red, width: 5),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}
