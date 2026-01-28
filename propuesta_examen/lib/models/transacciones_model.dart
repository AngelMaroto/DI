class TransaccionesModel {
  final int? id;
  final double inputValue;
  final String inputUnit;
  final String outputUnit;
  final double result;

  TransaccionesModel({
    this.id,
    required this.inputValue,
    required this.inputUnit,
    required this.outputUnit,
    required this.result,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'inputValue': inputValue,
      'inputUnit': inputUnit,
      'outputUnit': outputUnit,
      'result': result,
    };
  }

  factory TransaccionesModel.fromMap(Map<String, dynamic> map) =>
      TransaccionesModel(
        id: map['id'],
        inputValue: map['inputValue'],
        inputUnit: map['inputUnit'],
        outputUnit: map['outputUnit'],
        result: map['result'],
      );
}
