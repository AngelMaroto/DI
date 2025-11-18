import 'package:flutter/material.dart';

/// Función principal que inicia la app y muestra la pantalla RegistroFormScreen
/// # INICIO DE LA APP
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, /// Oculta la etiqueta debug
    home: RegistroFormScreen(), /// Pantalla inicial del app
  ));
}

/// Widget Stateful para el formulario de registro, permite manejar estado interno
class RegistroFormScreen extends StatefulWidget {
  @override
  State<RegistroFormScreen> createState() => RegistroFormScreenState();
}

/// Estado del formulario de registro
class RegistroFormScreenState extends State<RegistroFormScreen> {
  /// Clave única para validar y manejar el formulario
  final formKey = GlobalKey<FormState>();

  /// Controladores para obtener y modificar el valor de los TextFormFields
  final emailController = TextEditingController();
  final loginController = TextEditingController();
  final passController = TextEditingController();
  final passRepeatController = TextEditingController();

  /// Valor seleccionado en el dropdown de términos
  String terminos = 'Aceptar Términos';

  /// **Expresión regular para validar formato de email**
  ///
  /// *^ indica el inicio de la cadena.*
  /// *[\w-\.]+ valida uno o más caracteres que sean letras, números, guion bajo (_), guion medio (-) o punto (.). Esto corresponde a la parte local del email, antes de la arroba (@).
  /// *@ indica que debe haber un símbolo arroba.*
  /// *([\w-]+\.)+ valida uno o más grupos formados por uno o más caracteres alfanuméricos o guion medio, seguidos de un punto. Esta es la parte del dominio, por ejemplo, "gmail." en "gmail.com".*
  /// *[\w-]{2,4} valida entre 2 y 4 caracteres alfanuméricos o guion al final, que corresponde a la extensión del dominio, como "com", "org", "net".*
  /// *$ indica el fin de la cadena.*
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  /// Estados para mostrar u ocultar contraseñas en los campos correspondientes
  bool obscurePass = true;
  bool obscurePassRepeat = true;

  /// Método para limpiar el formulario: borrar campos y resetear estado
  void _clearForm() {
    setState(() {
      emailController.clear();
      loginController.clear();
      passController.clear();
      passRepeatController.clear();
      terminos = 'Aceptar Términos';
      formKey.currentState?.reset();
      obscurePass = true;
      obscurePassRepeat = true;
    });
  }

  /// Método para enviar formulario, primero valida y luego navega mostrando datos ingresados
  void enviarFormulario() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DatosIngresadosScreen(
            email: emailController.text.trim(), // Extrae y limpia espacios del email
            login: loginController.text.trim(), // Extrae y limpia espacios del login
            terminos: terminos, // Pasa el valor seleccionado en términos
          ),
        ),
      );
    }
  }

  /// Método que construye la UI de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro")), // Barra superior con título
      body: Padding(
        padding: EdgeInsets.all(24), // Espaciado alrededor del formulario
        child: Form(
          key: formKey, // Asocia el formulario con la clave para validación
          child: ListView(
            children: [
              // Campo Email
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Introduce el email";
                  if (!emailRegex.hasMatch(val)) return "Email inválido";
                  return null;
                },
              ),
              SizedBox(height: 16), // Espacio vertical

              // Campo Login
              TextFormField(
                controller: loginController,
                decoration: InputDecoration(labelText: "Login"),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Introduce el login";
                  // No permitir login "admin"
                  if (val.trim().toLowerCase() == "admin")
                    return "No puedes usar 'admin' como login";
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Campo Contraseña con opción mostrar/ocultar (usa _obscurePass)
              TextFormField(
                controller: passController,
                obscureText: obscurePass, // Oculta texto si es true
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePass ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePass = !obscurePass; // Cambia el estado para mostrar/ocultar
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

              //Campo Repetir Contraseña con mostrar/ocultar (usa _obscurePassRepeat)
              TextFormField(
                controller: passRepeatController,
                obscureText: obscurePassRepeat,
                decoration: InputDecoration(
                  labelText: "Repite Contraseña",
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassRepeat ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassRepeat = !obscurePassRepeat; // Toggle mostrar/ocultar
                      });
                    },
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Vuelve a escribir la contraseña";
                  if (val != passController.text) return "Las contraseñas no coinciden";
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Dropdown para aceptar términos
              DropdownButtonFormField<String>(
                value: terminos, // Valor actual seleccionado
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

              // Botones Enviar y Borrar
              Row(
                children: [
                  ElevatedButton(
                    onPressed: enviarFormulario, // Intenta enviar formulario
                    child: Text("Enviar"),
                  ),
                  SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: _clearForm, // Limpia formulario al pulsar
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

/// Pantalla para mostrar datos ingresados tras enviar formulario
class DatosIngresadosScreen extends StatelessWidget {
  final String email;
  final String login;
  final String terminos;

  /// Constructor con campos requeridos
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
