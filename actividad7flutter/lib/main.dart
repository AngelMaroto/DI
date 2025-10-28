import 'package:flutter/material.dart';

class TarjetaPersonalizada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16), // Margen alrededor del contenedor
      padding: EdgeInsets.all(20), // Relleno interno del contenedor
      decoration: BoxDecoration(
        color: Colors.white, // Fondo blanco
        borderRadius: BorderRadius.circular(15), // Bordes redondeados
        border: Border.all(
          color: Colors.grey.shade400, // Color del borde
          width: 2, // Grosor del borde
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Título de la Tarjeta',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Este es el contenido de la tarjeta dentro del container con estilos personalizados.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
