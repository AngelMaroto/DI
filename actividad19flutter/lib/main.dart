import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DownloadSimulator(),
  ));
}

class DownloadSimulator extends StatefulWidget {
  @override
  State<DownloadSimulator> createState() => _DownloadSimulatorState();
}

class _DownloadSimulatorState extends State<DownloadSimulator> {
  double progress = 0.0; // Entre 0.0 y 1.0

  void increaseProgress() {
    setState(() {
      progress += 0.1;
      if (progress > 1.0) progress = 1.0;
    });
  }
  ///pantalla principal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simulador de descarga")),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Descargando archivo...",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 32),
            LinearProgressIndicator(
              value: progress,
              minHeight: 12,
            ),
            SizedBox(height: 16),
            Text(
              "${(progress * 100).round()}%",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: progress < 1.0 ? increaseProgress : null,
              child: Text("Aumentar progreso"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
