import 'package:actividad35flutter/domain/entities/entities/producto.dart';

class ProductoModel extends Producto{
  ProductoModel({required super.nombre, required super.precio});
  
  Map<String, dynamic> toJson(){
    return{
      'nombre':nombre,
      'precio':precio;
    };
  }
}