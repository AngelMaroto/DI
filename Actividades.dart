import 'dart:io';

void main(){
  //introducir datos
   String? entrada = stdin.readLineSync();
  
  //comprobar datos
  //print(entrada);
  //bucle hasta el numero
  int numeroMaximo = int.parse(entrada!);
  int aux = 2;
  while(aux < numeroMaximo){
    
  if(numeroMaximo%aux==0){
      print("$numeroMaximo no es primo");
      break;
    }
    aux++;
    if (aux==numeroMaximo){
      print("$numeroMaximo es primo");
    }
  }
  

  print("Introduce un numero");
  

  }
  //calcular primo o no cada numero
