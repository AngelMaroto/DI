import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

void main() async {
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

  runApp(FormularioApp(database: database));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}

class FormularioApp extends StatelessWidget {
  const FormularioApp({required this.database});

  final Database database;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FormularioScreen(database: database));
  }
}

class FormularioScreen extends StatefulWidget {
  final Database database;
  FormularioScreen({required this.database});
  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {

  final nomCtrll = TextEditingController();
  final edadCtrll = TextEditingController();

  List<Map<String, dynamic>> _forms = [];

  @override
  void initState() {
    super.initState();
    _loadForms();
  }

  Future<void> _addForm(String nombre, String edad) async{
    await widget.database.insert('forms', {'nombre': nomCtrll.text, 'edad': edadCtrll.text});
    nomCtrll.clear();
    edadCtrll.clear();
  }

  Future<void> _loadForms() async{
    final forms = await widget.database.query('forms');
    setState(() {
      _forms = forms;
    });
  }

  @override
  Widget build(BuildContext context) {
    initState(
      
    );
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nomCtrll,
            decoration: InputDecoration(hintText: "Introduce un nombre"),
          ),
          TextField(
            controller: edadCtrll,
            decoration: InputDecoration(hintText: "Edad")),
          ElevatedButton(
            onPressed: () =>
            _addForm(nomCtrll.text, edadCtrll.text)
            , child: Text("Guardar")),
          ElevatedButton(onPressed: ()=>
          _loadForms(), 
          child: Text("Mostrar")
          ),
          Expanded(
            child: child)
        ],
      ),
    );
  }
}
