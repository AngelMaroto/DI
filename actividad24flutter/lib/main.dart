import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginScreen(),
      '/perfil_usuario': (context) => PerfilUsuarioScreen(),
    },
  ));
}

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: userController,
                decoration: InputDecoration(labelText: "Usuario"),
                validator: (val) =>
                    val == null || val.trim().isEmpty ? "Introduce el usuario" : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passController,
                decoration: InputDecoration(labelText: "Contraseña"),
                obscureText: true,
                validator: (val) =>
                    val == null || val.trim().isEmpty ? "Introduce la contraseña" : null,
              ),
              SizedBox(height: 28),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      '/perfil_usuario',
                      arguments: userController.text.trim(),
                    );
                  }
                },
                child: Text("Iniciar Sesión", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PerfilUsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String nombreUsuario =
        ModalRoute.of(context)?.settings.arguments as String? ?? "Usuario";

    return Scaffold(
      appBar: AppBar(title: Text("Perfil Usuario")),
      body: Center(
        child: Text(
          "¡Bienvenido, $nombreUsuario!",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
