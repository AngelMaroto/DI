import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  List<String> images = [
    "https://placehold.co/600x400.png",
    "https://placehold.co/700x400.png",
    "https://placehold.co/800x400.png",
    "https://placehold.co/900x400.png",
    "https://placehold.co/200x400.png",
    "https://placehold.co/300x400.png",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: images.length,
          itemBuilder: (contexto, indice) {
            String url = images[indice];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(10),
              child: Image.network(url),
            );
          },
        ),
      ),
    );
  }
}
