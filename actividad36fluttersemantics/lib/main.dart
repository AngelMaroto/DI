import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale? _locale; 

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale, 
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('es')],

      home: Formulario(onLocaleChange: setLocale),
    );
  }
}

class Formulario extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const Formulario({super.key, required this.onLocaleChange});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  double _tamanoletra = 30.0;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  void _enviar() {
    if (_formKey.currentState!.validate()) {
      print("Formulario válido");
    }
  }


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Semantics(
              label: l10n.textField,
              hint: l10n.textField,
              child: TextFormField(
                controller: _nameCtrl,
                style: TextStyle(fontSize: _tamanoletra),
                decoration: InputDecoration(
                  labelText: l10n.textField,
                  labelStyle: TextStyle(fontSize: _tamanoletra),
                ),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? "Introduce un nombre"
                    : null,
              ),
            ),
            Semantics(
              label: l10n.emailField,
              hint: l10n.emailField,
              child: TextFormField(
                controller: _emailCtrl,
                style: TextStyle(fontSize: _tamanoletra),
                decoration: InputDecoration(
                  labelText: l10n.emailField,
                  labelStyle: TextStyle(fontSize: _tamanoletra),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El correo es obligatorio";
                  }
                  if (!value.contains('@')) {
                    return "El correo debe contener un @";
                  }
                  return null;
                },
              ),
            ),
            Semantics(
              label: l10n.sendButton,
              hint: l10n.sendButton,
              child: ElevatedButton(
                onPressed: _enviar,
                child: Text(
                  l10n.sendButton,
                  style: TextStyle(fontSize: _tamanoletra),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Slider(
                value: _tamanoletra,
                min: 10.0,
                max: 50.0,
                divisions: 40,
                label: _tamanoletra.round().toString(),
                onChanged: (double nuevo) {
                  setState(() {
                    _tamanoletra = nuevo;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: (){
                widget.onLocaleChange(Locale('en'));
              },
              child: Text("Traducir Inglés",
              style: TextStyle(
                fontSize: _tamanoletra
              ),)),
              ElevatedButton(
              onPressed: () {
                widget.onLocaleChange(Locale('es'));
              }, 
              child: Text(
                "Traducir español",
                style: TextStyle(
                  fontSize: _tamanoletra
                ),)),
          ],
        ),
      ),
    );
  }
}
