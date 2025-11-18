import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TarjetasScreen(),
  ));
}

class TarjetasScreen extends StatelessWidget {
  // Lista de datos de ejemplo con título e imagen URL
  final List<Map<String, String>> items = [
    {
      'titulo': 'Montañas',
      'imagen': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?fit=crop&w=600&q=80',
    },
    {
      'titulo': 'Playa',
      'imagen': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?fit=crop&w=600&q=80',
    },
    {
      'titulo': 'Ciudad',
      'imagen': 'https://images.unsplash.com/photo-1494526585095-c41746248156?fit=crop&w=600&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tarjetas con Imagen")),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            // Margen alrededor de la tarjeta
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            // Decoración con bordes redondeados y sombra
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3), // Sombra hacia abajo
                ),
              ],
            ),
            // Padding interno para separar contenido de bordes
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index]['titulo']!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    items[index]['imagen']!,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[200], // Fondo gris claro para contraste
    );
  }
}
