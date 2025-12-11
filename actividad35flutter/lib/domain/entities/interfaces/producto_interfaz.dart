import 'package:actividad35flutter/domain/entities/entities/producto.dart';

abstract class RepositorioProductoInterfaz{
  Future<List<Producto>> obtenerProductos();
}