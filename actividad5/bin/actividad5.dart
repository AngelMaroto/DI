import 'package:actividad5/actividad5.dart' as actividad5;

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

void main(List<String> arguments) async {

  var url =
      Uri.http('jsonplaceholder.typicode.com', '/todos/1');

  var response = await http.get(url);
  if (response.statusCode == 200) {
    print("ha funcionado");
    
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);  
   // var itemCount = jsonResponse['totalItems'];
   // print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}