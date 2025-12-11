import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' hide context;
import 'dart:io';

// ------------------------------------------------------------------
// 1. MODELO DE DATOS
// ------------------------------------------------------------------
class Transaccion {
  final int? id;
  final String tipo; // "Gasto" o "Ingreso"
  final String categoria;
  final double dinero;
  final String fecha;

  Transaccion({
    this.id,
    required this.tipo,
    required this.categoria,
    required this.dinero,
    required this.fecha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipo': tipo,
      'categoria': categoria,
      'dinero': dinero,
      'fecha': fecha,
    };
  }

  factory Transaccion.fromMap(Map<String, dynamic> map) {
    return Transaccion(
      id: map['id'],
      tipo: map['tipo'],
      categoria: map['categoria'],
      dinero: map['dinero'],
      fecha: map['fecha'],
    );
  }
}

// ------------------------------------------------------------------
// 2. PROVIDER (Lógica de Negocio)
// ------------------------------------------------------------------
class TransactionProvider extends ChangeNotifier {
  Database? _database;
  List<Transaccion> _transacciones = [];

  List<Transaccion> get transacciones => _transacciones;

  // --- NUEVO: Getter para calcular el balance total en tiempo real ---
  double get balanceTotal {
    double total = 0;
    for (var item in _transacciones) {
      if (item.tipo == "Ingreso") {
        total += item.dinero;
      } else {
        total -= item.dinero;
      }
    }
    return total;
  }

  Future<void> initDB() async {
    final dbPath = join(await getDatabasesPath(), 'gastos_app_v2.db');

    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE transacciones(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tipo TEXT,
            categoria TEXT,
            dinero REAL,
            fecha TEXT
          )
          ''');
      },
    );
    await cargarTransacciones();
  }

  Future<void> cargarTransacciones() async {
    if (_database == null) return;
    final List<Map<String, dynamic>> maps = await _database!.query(
      'transacciones',
      orderBy: "id DESC",
    );
    _transacciones = List.generate(
      maps.length,
      (i) => Transaccion.fromMap(maps[i]),
    );
    notifyListeners();
  }

  Future<void> agregarTransaccion(Transaccion t) async {
    if (_database == null) return;
    await _database!.insert(
      'transacciones',
      t.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await cargarTransacciones();
  }

  // --- NUEVO: Función para borrar ---
  Future<void> borrarTransaccion(int id) async {
    if (_database == null) return;
    await _database!.delete('transacciones', where: 'id = ?', whereArgs: [id]);
    await cargarTransacciones(); // Actualizamos la lista y el balance
  }
}

// ------------------------------------------------------------------
// 3. MAIN
// ------------------------------------------------------------------
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  final provider = TransactionProvider();
  await provider.initDB();

  runApp(ChangeNotifierProvider.value(value: provider, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueAccent),
      home: const InsertarDato(),
    );
  }
}

// ------------------------------------------------------------------
// 4. DRAWER
// ------------------------------------------------------------------
class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text(
                  'Gestor de Gastos',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Insertar Dato'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const InsertarDato()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Transacciones'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Transacciones()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------
// 5. PANTALLA 1: INSERTAR DATO
// ------------------------------------------------------------------
class InsertarDato extends StatefulWidget {
  const InsertarDato({super.key});

  @override
  State<InsertarDato> createState() => _InsertarDatoState();
}

class _InsertarDatoState extends State<InsertarDato> {
  final List<bool> _esGastoOIngreso = [true, false];
  String? _categoriaSeleccionada;
  final TextEditingController _dineroController = TextEditingController();

  final List<String> _categoriasGastos = [
    'Luz',
    'Agua',
    'Comida',
    'Alquiler',
    'Ocio',
  ];
  final List<String> _categoriasIngresos = [
    'Nómina',
    'Venta',
    'Regalo',
    'Inversión',
  ];

  @override
  Widget build(BuildContext context) {
    bool esGasto = _esGastoOIngreso[0];
    List<String> listaActual = esGasto
        ? _categoriasGastos
        : _categoriasIngresos;
    Color colorTema = esGasto ? Colors.red : Colors.green;

    return Scaffold(
      appBar: AppBar(title: const Text("Insertar Datos")),
      drawer: const MiDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tipo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: ToggleButtons(
                isSelected: _esGastoOIngreso,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _esGastoOIngreso.length; i++) {
                      _esGastoOIngreso[i] = i == index;
                    }
                    _categoriaSeleccionada = null;
                  });
                },
                borderRadius: BorderRadius.circular(10),
                selectedColor: Colors.white,
                fillColor: colorTema,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Gasto"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Ingreso"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Categoría",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: _categoriaSeleccionada,
              hint: const Text("Selecciona una categoría"),
              items: listaActual.map((String categoria) {
                return DropdownMenuItem<String>(
                  value: categoria,
                  child: Text(categoria),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _categoriaSeleccionada = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Dinero",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _dineroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorTema,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _guardarDato(esGasto),
                child: const Text("Guardar", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _guardarDato(bool esGasto) async {
    if (_categoriaSeleccionada == null || _dineroController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Rellena todos los campos")));
      return;
    }

    final nuevaTransaccion = Transaccion(
      tipo: esGasto ? "Gasto" : "Ingreso",
      categoria: _categoriaSeleccionada!,
      dinero: double.tryParse(_dineroController.text) ?? 0.0,
      fecha: DateTime.now().toString(),
    );

    await Provider.of<TransactionProvider>(
      context,
      listen: false,
    ).agregarTransaccion(nuevaTransaccion);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${esGasto ? 'Gasto' : 'Ingreso'} guardado correctamente",
        ),
        backgroundColor: esGasto ? Colors.red : Colors.green,
      ),
    );

    _dineroController.clear();
    setState(() {
      _categoriaSeleccionada = null;
    });
  }
}

// ------------------------------------------------------------------
// 6. PANTALLA 2: TRANSACCIONES (MODIFICADA)
// ------------------------------------------------------------------
class Transacciones extends StatelessWidget {
  const Transacciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transacciones")),
      drawer: const MiDrawer(),
      body: Consumer<TransactionProvider>(
        builder: (context, provider, child) {
          final lista = provider.transacciones;
          final balance =
              provider.balanceTotal; // Obtenemos el balance calculado

          return Column(
            children: [
              // --- SECCIÓN BALANCE ---
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: balance >= 0
                      ? Colors.green.shade100
                      : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: balance >= 0 ? Colors.green : Colors.red,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Balance Actual",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${balance.toStringAsFixed(2)} €",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: balance >= 0
                            ? Colors.green.shade800
                            : Colors.red.shade800,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(),

              // --- SECCIÓN LISTA ---
              Expanded(
                child: lista.isEmpty
                    ? const Center(child: Text("No hay movimientos"))
                    : ListView.builder(
                        itemCount: lista.length,
                        itemBuilder: (context, index) {
                          final item = lista[index];
                          final bool esGasto = item.tipo == "Gasto";

                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: ListTile(
                              // Icono a la izquierda
                              leading: CircleAvatar(
                                backgroundColor: esGasto
                                    ? Colors.red.shade100
                                    : Colors.green.shade100,
                                child: Icon(
                                  esGasto
                                      ? Icons.arrow_downward
                                      : Icons.arrow_upward,
                                  color: esGasto ? Colors.red : Colors.green,
                                ),
                              ),
                              // Cantidad y Tipo
                              title: Text(
                                "${item.dinero.toStringAsFixed(2)} €",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "${item.categoria}  •  ${item.fecha.substring(0, 10)}",
                              ),

                              // --- BOTÓN ELIMINAR ---
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  // Llamamos a borrar en el provider
                                  if (item.id != null) {
                                    provider.borrarTransaccion(item.id!);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Transacción eliminada"),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
