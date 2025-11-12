import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegistrationForm(),
  ));
}

class RegistrationForm extends StatefulWidget {
  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

  String name = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nombre"),
                onChanged: (val) => name = val,
                validator: (val) =>
                    val == null || val.trim().isEmpty ? "Introduce tu nombre" : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Correo electrónico"),
                onChanged: (val) => email = val,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return "Introduce tu correo electrónico";
                  }
                  if (!_emailRegex.hasMatch(val.trim())) {
                    return "Correo electrónico inválido";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Contraseña"),
                obscureText: true,
                onChanged: (val) => password = val,
                validator: (val) =>
                    val == null || val.isEmpty ? "Introduce tu contraseña" : null,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Todos los campos son válidos
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("¡Formulario válido!")),
                    );
                  }
                },
                child: Text("Enviar", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
