import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

void main() async{
  // Inicializar sqflite para escritorio
  sqfliteFfiInit();
  final databaseFactory = databaseFactoryFfi;
  // Ruta para la base de datos
  final dbPath = join(await databaseFactory.getDatabasesPath(), 'form.db');
  final database = await databaseFactory.openDatabase(dbPath);
  // Crear tabla de tareas si no existe
  await database.execute('''
    CREATE TABLE IF NOT EXISTS forms (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    edad TEXT NOT NULL
    )
    ''');
  runApp(const InsertarDato());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

class InsertarDato extends StatefulWidget {
  const InsertarDato({super.key});

  @override
  State<InsertarDato> createState() => _InsertarDatoState();
}

class _InsertarDatoState extends State<InsertarDato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Insertar Datos"),),
      body: Center(

      ),
    );
  }
}