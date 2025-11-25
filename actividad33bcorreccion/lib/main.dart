import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, theme, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notas',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: theme.themeMode,
        home: const HomeScreen(),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDark;
    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes')),
      body: ListTile(
        title: const Text('Modo oscuro'),
        trailing: Switch(
          value: isDark,
          onChanged: (_) => context.read<ThemeProvider>().toggleTheme(),
        ),
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;
  ThemeProvider() {
    _loadFromPrefs();
  }
  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('isDark') ?? false;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDark = !_isDark;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', _isDark);
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final notesProvider = context.watch<NotesProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (_) => SettingsScreen()
          )
          );
        }, 
        icon: Icon(Icons.settings)),
        title: Text("Lista de notas"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5
          
        ),
        itemCount: notesProvider.lista.length,
        itemBuilder: (BuildContext context, int index) {
          final note = notesProvider.lista[index];
          return Card( 
              child: Column(
              children: [
                Text(note.titulo),
                Text(note.descripcion),
                OverflowBar(
                  spacing: 8,
                  overflowAlignment: OverflowBarAlignment.end,
                ),
                OverflowBar(
                  spacing: 8,
                  overflowAlignment: OverflowBarAlignment.center,
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: (_)=>AddNoteScreen()
        ),
        );
      },
      child: Icon(Icons.add),
      ),
    );
  }
  }

  class Note{
    String titulo;
    String descripcion;

    Note(this.titulo, this.descripcion);
  }

  class NotesProvider extends ChangeNotifier{

    final _lista = <Note>[];
    List<Note> get lista => _lista;
    void addNote(Note nota){
      _lista.add(nota);
      notifyListeners();
    }

  }

  class AddNoteScreen extends StatefulWidget {
    const AddNoteScreen({super.key});
  
    @override
    State<AddNoteScreen> createState() => _AddNoteScreenState();
  }

  
  class _AddNoteScreenState extends State<AddNoteScreen> {
    TextEditingController titleCtrl = TextEditingController();
    TextEditingController descCtrl = TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Crear Notas"),
        ),
        body: Center(
          child: Form(
            child: Column(
              children: 
              [TextFormField(
                controller: titleCtrl,
                decoration: InputDecoration(hintText: "Introduce un título"),
              ),
              TextFormField(
                controller: descCtrl,
                decoration: InputDecoration(hintText: "Introduce una descripción"),
              ),
              ElevatedButton(onPressed: (){
                context.read<NotesProvider>().addNote(
                  Note(titleCtrl.text, descCtrl.text)
                );
                Navigator.pop(context, 
                MaterialPageRoute(builder: (_)=>HomeScreen()
                ),
                );
              }, 
              child: Text("Guardar"))
              ],
            ) 
          ),
        ),
      );
    }
  }