import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            Container(decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 5),
            borderRadius: BorderRadius.circular(50), 
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(10),child: Image.network('https://placehold.co/800x900.png'),
            ),
            Container(decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 5),
            borderRadius: BorderRadius.circular(50), 
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(10),child: Image.network('https://placehold.co/800x900.png'),
            ),
            Container(decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 5),
            borderRadius: BorderRadius.circular(50), 
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(10),child: Image.network('https://placehold.co/800x900.png'),
            ),
            Container(decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 5),
            borderRadius: BorderRadius.circular(50), 
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(10),child: Image.network('https://placehold.co/800x900.png'),
            ),
            Container(decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 5),
            borderRadius: BorderRadius.circular(50), 
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(10),child: Image.network('https://placehold.co/800x900.png'),
            ),
            Container(decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 5),
            borderRadius: BorderRadius.circular(50), 
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(10),child: Image.network('https://placehold.co/800x900.png'),
            ),
          ],
        ),
      ),
    );
  }
}
