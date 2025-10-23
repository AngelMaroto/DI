import 'package:asincrona/asincrona.dart' as asincrona;
import 'dart:async';

  
Future<void> fetchData() async {
 print('Iniciando la carga de datos...');
 await Future.delayed(Duration(seconds: 3)); // Simula una operación que toma tiempo
 print('Datos cargados con éxito');
}
void main() async {
 print('Inicio del programa');
 await fetchData(); // Espera a que la función termine antes de continuar
 print('Programa finalizado');
}


