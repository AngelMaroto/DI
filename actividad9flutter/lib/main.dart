/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Zapatos Deportivos",
      "price": 59.99,
      "image": "assets/images/zapatos.png",
      "margin": EdgeInsets.all(10),
      "padding": EdgeInsets.all(15),
    },
    {
      "name": "Reloj Inteligente",
      "price": 120.00,
      "image": "assets/images/reloj.png",
      "margin": EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      "padding": EdgeInsets.symmetric(horizontal: 12, vertical: 18),
    },
    {
      "name": "Auriculares",
      "price": 30.49,
      "image": "assets/images/auriculares.png",
      "margin": EdgeInsets.fromLTRB(5, 12, 25, 12),
      "padding": EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Productos',
      home: Scaffold(
        appBar: AppBar(title: Text('Lista de Productos')),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              margin: product["margin"],
              padding: product["padding"],
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    product["image"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product["name"],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "\$${product["price"].toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 16, color: Colors.green[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
*/
//Version con imagen de url:
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Zapatos Deportivos",
      "price": 59.99,
      "image": "assets/images/zapatos.png",
      "isNetworkImage": false,
      "margin": EdgeInsets.all(10),
      "padding": EdgeInsets.all(15),
    },
    {
      "name": "Reloj Inteligente",
      "price": 120.00,
      // Aquí la imagen viene de internet:
      "image": "https://placehold.co/800x900.png",
      "isNetworkImage": true, // Indicador de que será de internet
      "margin": EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      "padding": EdgeInsets.symmetric(horizontal: 12, vertical: 18),
    },
    {
      "name": "Auriculares",
      "price": 30.49,
      "image": "assets/images/auriculares.png",
      "isNetworkImage": false,
      "margin": EdgeInsets.fromLTRB(5, 12, 25, 12),
      "padding": EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Productos',
      home: Scaffold(
        appBar: AppBar(title: Text('Lista de Productos')),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              margin: product["margin"],
              padding: product["padding"],
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  product["isNetworkImage"]
                      ? Image.network(
                          product["image"],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          product["image"],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product["name"],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "\$${product["price"].toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 16, color: Colors.green[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
