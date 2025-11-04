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
        appBar: AppBar(title: Text('Configuración')),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notificaciones'),
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Idioma'),
              onTap: () {
                // Cambiar idioma
              },
            ),
          ],
        ),
      ),
    );
  }
}
