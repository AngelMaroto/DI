import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDataSource{

Future<List<dynamic>> obtenerJSON() async {
  await Future.delayed(Duration(seconds: 3));
  var json = await rootBundle.loadString('assets/productos.JSON');
  return jsonDecode(json) as List;
}
}