import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppConPestanas(),
  ));
}

class AppConPestanas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('App con Pestañas'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.person), text: 'Perfil'),
              Tab(icon: Icon(Icons.settings), text: 'Ajustes'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Home', style: TextStyle(fontSize: 26))),
            Center(child: Text('Perfil', style: TextStyle(fontSize: 26))),
            Center(child: Text('Ajustes', style: TextStyle(fontSize: 26))),
          ],
        ),
      ),
    );
  }
}
