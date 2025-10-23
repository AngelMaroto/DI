import 'dart:io';

void main(){
  print("introduce un numero maximo para generar un primo");
  int numero = stdin.readByteSync();
  for(int i =0; i < numero; i++){
    var division = i%numero;
    print('$division');
  }

}