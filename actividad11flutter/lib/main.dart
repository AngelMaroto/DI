import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Introduce tu nombre'),
                onChanged: (text) {
                  print('Texto introducido; $text');
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Introduce tu correo'),
                onChanged: (text) {
                  print('Texto introducido; $text');
                },
                validator: (text){
                  if(text == null || text.isEmpty){
                    return 'esta vacio';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Introduce tu contraseña',
                ),
                onChanged: (text) {
                  print('Texto introducido; $text');
                },
                obscureText: true,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Enviar')),
            ],
          ),
        ),
      ),
    );
  }
}
