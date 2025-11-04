import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: ListaElementos()));
  }
}

class ListaElementos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListaElementosState();
}

class ListaElementosState extends State<ListaElementos> {
  bool estado = true;
  bool estado1 = true;
  bool estado2 = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(
            "ejemplo1",
            style: TextStyle(
              color: estado ? Colors.grey : Colors.black,
              decoration: estado
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          trailing: Checkbox(
            value: estado,
            onChanged: (bool? value) {
              setState(() {
                estado = !estado;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            "ejemplo2",
            style: TextStyle(
              color: estado1 ? Colors.grey : Colors.black,
              decoration: estado1
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          trailing: Checkbox(
            value: estado1,
            onChanged: (bool? value) {
              setState(() {
                estado1 = !estado1;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            "ejemplo3",
            style: TextStyle(
              color: estado2 ? Colors.grey : Colors.black,
              decoration: estado2
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          trailing: Checkbox(
            value: estado2,
            onChanged: (bool? value) {
              setState(() {
                estado2 = !estado2;
              });
            },
          ),
        ),
      ],
    );
  }
}
