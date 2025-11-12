import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppNavegacionInferior(),
  ));
}

class AppNavegacionInferior extends StatefulWidget {
  @override
  State<AppNavegacionInferior> createState() => _AppNavegacionInferiorState();
}

class _AppNavegacionInferiorState extends State<AppNavegacionInferior> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    Center(child: Text('Home', style: TextStyle(fontSize: 26))),
    Center(child: Text('Perfil', style: TextStyle(fontSize: 26))),
    Center(child: Text('Ajustes', style: TextStyle(fontSize: 26))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(['Home', 'Perfil', 'Ajustes'][_selectedIndex])),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
