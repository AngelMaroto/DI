import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

void main() async {
  // 1. IMPORTANTE: Asegurar que los bindings están listos antes de usar plugins
  WidgetsFlutterBinding.ensureInitialized();

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

class FormularioApp extends StatelessWidget {
  const FormularioApp({super.key, required this.database});

  final Database database;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FormularioScreen(database: database));
  }
}

class FormularioScreen extends StatefulWidget {
  final Database database;
  const FormularioScreen({super.key, required this.database});

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
    _loadForms(); // Esto carga los datos al iniciar la pantalla
  }

  Future<void> _addForm() async {
    if (nomCtrll.text.isEmpty || edadCtrll.text.isEmpty) return;

    await widget.database.insert('forms', {
      'nombre': nomCtrll.text,
      'edad': edadCtrll.text,
    });
    nomCtrll.clear();
    edadCtrll.clear();
    _loadForms(); // Recargamos la lista para ver el cambio
  }

  Future<void> _loadForms() async {
    final forms = await widget.database.query('forms');
    setState(() {
      _forms = forms;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ¡AQUÍ NO DEBE HABER NADA DE initState()!

    return Scaffold(
      appBar: AppBar(title: const Text("Base de datos Simple")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nomCtrll,
              decoration: const InputDecoration(
                hintText: "Introduce un nombre",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: edadCtrll,
              decoration: const InputDecoration(hintText: "Edad"),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(onPressed: _addForm, child: const Text("Guardar")),
          const Divider(),
          const Text(
            "Datos Guardados:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          // Agregamos un ListView para VER los datos
          Expanded(
            child: ListView.builder(
              itemCount: _forms.length,
              itemBuilder: (context, index) {
                final item = _forms[index];
                return ListTile(
                  title: Text(item['nombre']),
                  subtitle: Text("Edad: ${item['edad']}"),
                  leading: CircleAvatar(child: Text("${item['id']}")),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
