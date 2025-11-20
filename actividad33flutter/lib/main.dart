import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp( ChangeNotifierProvider(create: (context)=>TaskProvider(),
  child: MainApp(),));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListTile(
          leading: Text("")
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => TaskList()));
        },
        child: Icon(Icons.add),),
      ),
    );
  }
}


class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final lista = context.watch<TaskProvider>().lista.toString();
    return Scaffold(
      body: TextField(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<TaskProvider>().anadirTareas(); 
        Navigator.pop(context);
      }),
    );
  }
}

class TaskProvider extends ChangeNotifier{
  List<String> _tareas = [];

  List<String> get lista => _tareas;

  void anadirTareas(String tarea){
    _tareas.add(tarea);
    notifyListeners();
  }

}
