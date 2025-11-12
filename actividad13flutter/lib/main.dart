import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WelcomeScreen(),
  ));
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Text(
              "¡Bienvenido!",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              // Mucho texto para probar el scroll
              "Esta es una app pensada para facilitarte la vida. Aquí podrás gestionar tus productos, leer notificaciones, registrar actividades y muchas cosas más. "
              "Nuestro objetivo es brindarte una experiencia intuitiva y sencilla, con acceso rápido a todas las funciones que necesitas para tu día a día.\n\n"
              "La plataforma está pensada para usuarios que buscan eficiencia, rapidez y seguridad. "
              "Además, contamos con soporte y ayuda en línea, tutoriales, integración entre dispositivos y actualizaciones frecuentes que agregan nuevas características.\n\n"
              "¿Quieres conocer más? Explora nuestras secciones, revisa tu perfil, gestiona tu inventario y descubre promociones exclusivas. "
              "Si tienes dudas, nuestro equipo de soporte está disponible 24/7 para ayudarte.\n\n"
              "¡No olvides seguirnos en redes sociales y suscribirte para obtener noticias y novedades antes que nadie! "
              "Actualizamos constantemente para que siempre disfrutes de la mejor experiencia.\n\n"
              "Haz login si ya tienes cuenta, o regístrate en tan solo unos segundos y sé parte de nuestra comunidad.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Aquí la lógica para ir a Login
              },
              child: Text("Login", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  padding: EdgeInsets.symmetric(vertical: 12)),
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                // Aquí la lógica para ir a Registro
              },
              child: Text("Registro", style: TextStyle(fontSize: 18)),
              style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  padding: EdgeInsets.symmetric(vertical: 12)),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
