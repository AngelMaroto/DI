import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: InsertarDato()));
  }
}

class InsertarDato extends StatefulWidget {
  const InsertarDato({super.key});

  @override
  State<InsertarDato> createState() => _InsertarDatoState();
}

class _InsertarDatoState extends State<InsertarDato> {
  bool esGasto = true;

  List<String> opcionesGasto = ["coche", "casa", "compra"];
  List<String> opcionesIngreso = ["salario", "donacion"];

  List<bool> opcionesToggle = <bool>[false, true];

  GlobalKey<FormFieldState> kewDropDown = GlobalKey();

  TextEditingController cantidadCtrll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> opcionSeleccionada = esGasto ? opcionesGasto : opcionesIngreso;
    return Form(
      child: Column(
        children: [
          ToggleButtons(
            isSelected: [!esGasto, esGasto],
            fillColor: esGasto ? Colors.red : Colors.green,
            selectedColor: Colors.white,
            onPressed: (int index) {
              setState(() {
                esGasto = index == 1;
                kewDropDown.currentState?.reset();
              }
              );
            },
            children: [Text("ingreso"), Text("Gasto")],
          ),
          DropdownButtonFormField(
            key: kewDropDown,
            items: opcionSeleccionada.map((String opcion) {
              return DropdownMenuItem(value: opcion, child: Text(opcion));
            }).toList(),
            onChanged: (dynamic aux) {
            },
          ),
          TextField(
            controller: cantidadCtrll,
            decoration: InputDecoration(labelText: "Cantidad", suffixText: "€"),
          ),
          ElevatedButton(onPressed: () {
          }, 
          child: Text("Guardar"),
          style: ElevatedButton.styleFrom(
            backgroundColor: esGasto ? Colors.red : Colors.green,
          )),
        ],
      ),
    );
  }
}

class Transaccion extends StatefulWidget {
  const Transaccion({super.key});

  @override
  State<Transaccion> createState() => _TransaccionState();
}

class _TransaccionState extends State<Transaccion> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
