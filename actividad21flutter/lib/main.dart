import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProductListScreen(),
  ));
}

class Producto {
  final String nombre;
  final double precio;
  final String descripcion;
  final String imageUrl;

  Producto({
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.imageUrl,
  });
}

class ProductListScreen extends StatelessWidget {
  final List<Producto> productos = [
    Producto(
      nombre: "Zapatos Deportivos",
      precio: 59.99,
      descripcion: "Calzado cómodo y resistente para correr.",
      imageUrl: "https://placehold.co/100x100.png",
    ),
    Producto(
      nombre: "Auriculares",
      precio: 29.50,
      descripcion: "Excelente calidad de sonido inalámbrico.",
      imageUrl: "https://placehold.co/100x100.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Productos")),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, i) {
          final producto = productos[i];
          return ListTile(
            leading: Image.network(producto.imageUrl, width: 50, height: 50),
            title: Text(producto.nombre),
            subtitle: Text("\$${producto.precio.toStringAsFixed(2)}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetallesProducto(producto: producto),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetallesProducto extends StatelessWidget {
  final Producto producto;

  const DetallesProducto({required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalles")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(producto.imageUrl, width: 120, height: 120),
            SizedBox(height: 16),
            Text(producto.nombre, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Precio: \$${producto.precio.toStringAsFixed(2)}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text(producto.descripcion, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
