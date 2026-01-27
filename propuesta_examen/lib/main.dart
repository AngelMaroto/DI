import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Conversor());
  }
}

class Conversor extends StatefulWidget {
  const Conversor({super.key});

  @override
  State<Conversor> createState() => _ConversorState();
}

List<String> lista = <String>["Kilometros", "Metros", "Millas"];

const conversionRates = {
  'Kilómetros': {'Kilómetros': 1.0, 'Metros': 1000.0, 'Millas': 0.621371},
  'Metros': {'Kilómetros': 0.001, 'Metros': 1.0, 'Millas': 0.000621371},
  'Millas': {'Kilómetros': 1.60934, 'Metros': 1609.34, 'Millas': 1.0},
};

class _ConversorState extends State<Conversor> {

  String dropdownValue = conversionRates.keys.first;
  String dropdownValue2 = conversionRates.keys.last;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conversor"), centerTitle: true),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.double_arrow),
              title: Text("Conversor"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text("Transactions"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Introduce un valor"),
                  border: OutlineInputBorder(),
                ),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: conversionRates.keys.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: dropdownValue2,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue2 = value!;
                  });
                },
                items: conversionRates.keys.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
