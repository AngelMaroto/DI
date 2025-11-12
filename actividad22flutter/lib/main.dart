import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/home': (context) => HomeScreen(),
      '/perfil': (context) => PerfilScreen(),
      '/ajustes': (context) => AjustesScreen(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pantalla Home", style: TextStyle(fontSize: 22)),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/perfil'),
              child: Text("Ir a Perfil"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/ajustes'),
              child: Text("Ir a Ajustes"),
            ),
          ],
        ),
      ),
    );
  }
}

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Perfil")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pantalla Perfil", style: TextStyle(fontSize: 22)),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              child: Text("Ir a Home"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/ajustes'),
              child: Text("Ir a Ajustes"),
            ),
          ],
        ),
      ),
    );
  }
}

class AjustesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajustes")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pantalla Ajustes", style: TextStyle(fontSize: 22)),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              child: Text("Ir a Home"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/perfil'),
              child: Text("Ir a Perfil"),
            ),
          ],
        ),
      ),
    );
  }
}
