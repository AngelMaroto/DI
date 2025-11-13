import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegistroFormScreen(),
  ));
}

class RegistroFormScreen extends StatefulWidget {
  @override
  State<RegistroFormScreen> createState() => _RegistroFormScreenState();
}

class _RegistroFormScreenState extends State<RegistroFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _loginController = TextEditingController();
  final _passController = TextEditingController();
  final _passRepeatController = TextEditingController();

  String terminos = 'Aceptar Términos';

  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Estado para mostrar/ocultar contraseñas
  bool _obscurePass = true;
  bool _obscurePassRepeat = true;

  void _clearForm() {
    setState(() {
      _emailController.clear();
      _loginController.clear();
      _passController.clear();
      _passRepeatController.clear();
      terminos = 'Aceptar Términos';
      _formKey.currentState?.reset();
      _obscurePass = true;
      _obscurePassRepeat = true;
    });
  }

  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DatosIngresadosScreen(
            email: _emailController.text.trim(),
            login: _loginController.text.trim(),
            terminos: terminos,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Introduce el email";
                  if (!emailRegex.hasMatch(val)) return "Email inválido";
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _loginController,
                decoration: InputDecoration(labelText: "Login"),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Introduce el login";
                  if (val.trim().toLowerCase() == "admin")
                    return "No puedes usar 'admin' como login";
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passController,
                obscureText: _obscurePass,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePass ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePass = !_obscurePass;
                      });
                    },
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Introduce una contraseña";
                  if (val.length < 9) return "Debe tener más de 8 caracteres";
                  if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(val)) {
                    return "Debe tener al menos un símbolo";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passRepeatController,
                obscureText: _obscurePassRepeat,
                decoration: InputDecoration(
                  labelText: "Repite Contraseña",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassRepeat ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassRepeat = !_obscurePassRepeat;
                      });
                    },
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Vuelve a escribir la contraseña";
                  if (val != _passController.text) return "Las contraseñas no coinciden";
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: terminos,
                items: [
                  DropdownMenuItem(value: 'Aceptar Términos', child: Text('Aceptar Términos')),
                  DropdownMenuItem(value: 'No Aceptar Términos', child: Text('No Aceptar Términos')),
                ],
                onChanged: (value) => setState(() => terminos = value!),
                decoration: InputDecoration(labelText: "Términos"),
                validator: (val) {
                  if (val != 'Aceptar Términos') return "Debes aceptar los términos";
                  return null;
                },
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _enviarFormulario,
                    child: Text("Enviar"),
                  ),
                  SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: _clearForm,
                    child: Text("Borrar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DatosIngresadosScreen extends StatelessWidget {
  final String email;
  final String login;
  final String terminos;

  const DatosIngresadosScreen({
    required this.email,
    required this.login,
    required this.terminos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Datos Ingresados")),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email: $email"),
            SizedBox(height: 8),
            Text("Login: $login"),
            SizedBox(height: 8),
            Text("Aceptó términos: $terminos"),
          ],
        ),
      ),
    );
  }
}
