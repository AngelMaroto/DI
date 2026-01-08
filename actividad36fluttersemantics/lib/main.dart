import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('es')],

      home: const Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>(); // Llave necesaria para validar
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

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
                decoration:  InputDecoration(labelText: l10n.textField),
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
                decoration: InputDecoration(labelText: l10n.emailField),
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
                child:  Text(l10n.sendButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}