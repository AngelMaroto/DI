import 'package:actividad36fluttersemantics/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '/l10n/app_localizations.dart';

class FormularioView extends StatefulWidget {
  const FormularioView({super.key});

  @override
  State<FormularioView> createState() => _FormularioViewState();
}

class _FormularioViewState extends State<FormularioView> {

  final formularioKey = GlobalKey<FormState>();
  final nombreCtrl = TextEditingController();
  final correoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Form(
        key: formularioKey,
        child: Column(
          children: [
            TextFormField(
              controller: nombreCtrl,
              decoration: InputDecoration(
                labelText: l10n.textField,
                hintText: l10n.textField,
              ),
            ),
            TextFormField(
              controller: correoCtrl,
              decoration: InputDecoration(
                labelText: l10n.emailField,
                hintText: l10n.emailField,
              ),
            ),
            OutlinedButton(
              onPressed: (){}, 
              child: Text(
                l10n.sendButton
              ))
          ],
        )),
    );
  }
}