import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: ColorPickerDemo()),
  );
}

class ColorPickerDemo extends StatefulWidget {
  @override
  State<ColorPickerDemo> createState() => _ColorPickerDemoState();
}

class _ColorPickerDemoState extends State<ColorPickerDemo> {
  Color? selectedColor;

  void _openColorSelector() async {
    final color = await Navigator.push<Color>(
      context,
      MaterialPageRoute(builder: (_) => SeleccionColor()),
    );
    if (color != null) {
      setState(() {
        selectedColor = color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo Selector de Color")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: selectedColor ?? Colors.grey[300],
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  selectedColor != null ? "Color elegido" : "Sin color",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _openColorSelector,
              child: Text("Seleccionar Color"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeleccionColor extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selecciona un color")),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: colors
              .map(
                (color) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    minimumSize: Size(60, 60),
                    shape: CircleBorder(),
                  ),

                  onPressed: () {
                    Navigator.pop(context, color);
                  },
                  child: Container(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
