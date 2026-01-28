import 'package:flutter/material.dart';
import 'package:propuesta_examen/models/transacciones_model.dart';
import 'package:propuesta_examen/viewmodel/transacciones_viewmodel.dart'; // Para acceder a la BD

class ConversorViewModel extends ChangeNotifier {
  // Datos lógicos
  final Map<String, Map<String, double>> conversionRates = {
    'Kilómetros': {'Kilómetros': 1.0, 'Metros': 1000.0, 'Millas': 0.621371},
    'Metros': {'Kilómetros': 0.001, 'Metros': 1.0, 'Millas': 0.000621371},
    'Millas': {'Kilómetros': 1.60934, 'Metros': 1609.34, 'Millas': 1.0},
  };

  String _dropdownValue = 'Kilómetros';
  String _dropdownValue2 = 'Millas';
  double _resultado = 0.0;

  // Getters
  String get dropdownValue => _dropdownValue;
  String get dropdownValue2 => _dropdownValue2;
  double get resultado => _resultado;
  List<String> get unidades => conversionRates.keys.toList();

  // Setters
  void setDropdownValue(String? value) {
    if (value != null) {
      _dropdownValue = value;
      notifyListeners();
    }
  }

  void setDropdownValue2(String? value) {
    if (value != null) {
      _dropdownValue2 = value;
      notifyListeners();
    }
  }

  // Lógica de negocio
  Future<void> convertirYGuardar(String textValue) async {
    if (textValue.isEmpty) return;

    double inputVal = double.tryParse(textValue) ?? 0;
    double rate = conversionRates[_dropdownValue]![_dropdownValue2]!;

    _resultado = inputVal * rate;
    notifyListeners(); // Actualiza la UI con el resultado

    final nuevaTransaccion = TransaccionesModel(
      inputValue: inputVal,
      inputUnit: _dropdownValue,
      outputUnit: _dropdownValue2,
      result: _resultado,
    );

    await DatabaseService.instance.insertTransaction(nuevaTransaccion);
  }
}
